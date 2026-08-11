#!/usr/bin/env python3
"""Inject ResilNetWatch target + WatchConnectivityBridge into Runner.xcodeproj."""

from __future__ import annotations

import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
PBX = ROOT / "Runner.xcodeproj" / "project.pbxproj"

# Stable 24-hex IDs (must be unique in project)
IDS = {
    "bridge_file": "A7WATCH01B71D6E00000001",
    "bridge_build": "A7WATCH01B71D6E00000002",
    "watch_app_ref": "A7WATCH01B71D6E00000003",
    "watch_app_swift": "A7WATCH01B71D6E00000004",
    "watch_content": "A7WATCH01B71D6E00000005",
    "watch_session": "A7WATCH01B71D6E00000006",
    "watch_info": "A7WATCH01B71D6E00000007",
    "watch_assets": "A7WATCH01B71D6E00000008",
    "watch_group": "A7WATCH01B71D6E00000009",
    "watch_target": "A7WATCH01B71D6E0000000A",
    "watch_sources": "A7WATCH01B71D6E0000000B",
    "watch_resources": "A7WATCH01B71D6E0000000C",
    "watch_frameworks": "A7WATCH01B71D6E0000000D",
    "build_app": "A7WATCH01B71D6E0000000E",
    "build_content": "A7WATCH01B71D6E0000000F",
    "build_session": "A7WATCH01B71D6E00000010",
    "build_assets": "A7WATCH01B71D6E00000011",
    "embed_phase": "A7WATCH01B71D6E00000012",
    "embed_build": "A7WATCH01B71D6E00000013",
    "dep_proxy": "A7WATCH01B71D6E00000014",
    "dep": "A7WATCH01B71D6E00000015",
    "cfg_debug": "A7WATCH01B71D6E00000016",
    "cfg_release": "A7WATCH01B71D6E00000017",
    "cfg_profile": "A7WATCH01B71D6E00000018",
    "cfg_list": "A7WATCH01B71D6E00000019",
}


def main() -> int:
    text = PBX.read_text()
    if "ResilNetWatch" in text and "WatchConnectivityBridge.swift" in text:
        print("Watch target already present")
        return 0

    # PBXBuildFile
    build_files = f"""
		{IDS['bridge_build']} /* WatchConnectivityBridge.swift in Sources */ = {{isa = PBXBuildFile; fileRef = {IDS['bridge_file']} /* WatchConnectivityBridge.swift */; }};
		{IDS['build_app']} /* ResilNetWatchApp.swift in Sources */ = {{isa = PBXBuildFile; fileRef = {IDS['watch_app_swift']} /* ResilNetWatchApp.swift */; }};
		{IDS['build_content']} /* ContentView.swift in Sources */ = {{isa = PBXBuildFile; fileRef = {IDS['watch_content']} /* ContentView.swift */; }};
		{IDS['build_session']} /* WatchSessionModel.swift in Sources */ = {{isa = PBXBuildFile; fileRef = {IDS['watch_session']} /* WatchSessionModel.swift */; }};
		{IDS['build_assets']} /* Assets.xcassets in Resources */ = {{isa = PBXBuildFile; fileRef = {IDS['watch_assets']} /* Assets.xcassets */; }};
		{IDS['embed_build']} /* ResilNetWatch.app in Embed Watch Content */ = {{isa = PBXBuildFile; fileRef = {IDS['watch_app_ref']} /* ResilNetWatch.app */; settings = {{ATTRIBUTES = (RemoveHeadersOnCopy, ); }}; }};
"""
    text = text.replace(
        "/* End PBXBuildFile section */",
        build_files + "/* End PBXBuildFile section */",
    )

    # Container proxy for watch dependency from Runner
    proxy = f"""
		{IDS['dep_proxy']} /* PBXContainerItemProxy */ = {{
			isa = PBXContainerItemProxy;
			containerPortal = 97C146E61CF9000F007C117D /* Project object */;
			proxyType = 1;
			remoteGlobalIDString = {IDS['watch_target']};
			remoteInfo = ResilNetWatch;
		}};
"""
    text = text.replace(
        "/* End PBXContainerItemProxy section */",
        proxy + "/* End PBXContainerItemProxy section */",
    )

    # Embed Watch Content copy phase
    copy_phase = f"""
		{IDS['embed_phase']} /* Embed Watch Content */ = {{
			isa = PBXCopyFilesBuildPhase;
			buildActionMask = 2147483647;
			dstPath = "$(CONTENTS_FOLDER_PATH)/Watch";
			dstSubfolderSpec = 16;
			files = (
				{IDS['embed_build']} /* ResilNetWatch.app in Embed Watch Content */,
			);
			name = "Embed Watch Content";
			runOnlyForDeploymentPostprocessing = 0;
		}};
"""
    text = text.replace(
        "/* End PBXCopyFilesBuildPhase section */",
        copy_phase + "/* End PBXCopyFilesBuildPhase section */",
    )

    # File references
    file_refs = f"""
		{IDS['bridge_file']} /* WatchConnectivityBridge.swift */ = {{isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = WatchConnectivityBridge.swift; sourceTree = "<group>"; }};
		{IDS['watch_app_ref']} /* ResilNetWatch.app */ = {{isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = ResilNetWatch.app; sourceTree = BUILT_PRODUCTS_DIR; }};
		{IDS['watch_app_swift']} /* ResilNetWatchApp.swift */ = {{isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ResilNetWatchApp.swift; sourceTree = "<group>"; }};
		{IDS['watch_content']} /* ContentView.swift */ = {{isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ContentView.swift; sourceTree = "<group>"; }};
		{IDS['watch_session']} /* WatchSessionModel.swift */ = {{isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = WatchSessionModel.swift; sourceTree = "<group>"; }};
		{IDS['watch_info']} /* Info.plist */ = {{isa = PBXFileReference; lastKnownFileType = text.plist.xml; path = Info.plist; sourceTree = "<group>"; }};
		{IDS['watch_assets']} /* Assets.xcassets */ = {{isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = Assets.xcassets; sourceTree = "<group>"; }};
"""
    text = text.replace(
        "/* End PBXFileReference section */",
        file_refs + "/* End PBXFileReference section */",
    )

    # Empty frameworks phase for watch
    frameworks = f"""
		{IDS['watch_frameworks']} /* Frameworks */ = {{
			isa = PBXFrameworksBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			runOnlyForDeploymentPostprocessing = 0;
		}};
"""
    text = text.replace(
        "/* End PBXFrameworksBuildPhase section */",
        frameworks + "/* End PBXFrameworksBuildPhase section */",
    )

    # Groups
    watch_group = f"""
		{IDS['watch_group']} /* ResilNetWatch */ = {{
			isa = PBXGroup;
			children = (
				{IDS['watch_app_swift']} /* ResilNetWatchApp.swift */,
				{IDS['watch_content']} /* ContentView.swift */,
				{IDS['watch_session']} /* WatchSessionModel.swift */,
				{IDS['watch_info']} /* Info.plist */,
				{IDS['watch_assets']} /* Assets.xcassets */,
			);
			path = ResilNetWatch;
			sourceTree = "<group>";
		}};
"""
    text = text.replace(
        "/* End PBXGroup section */",
        watch_group + "/* End PBXGroup section */",
    )

    # Add to main group children
    text = text.replace(
        """		97C146E51CF9000F007C117D = {
			isa = PBXGroup;
			children = (
				9740EEB11CF90186004384FC /* Flutter */,
				97C146F01CF9000F007C117D /* Runner */,
				97C146EF1CF9000F007C117D /* Products */,
				331C8082294A63A400263BE5 /* RunnerTests */,
				3443FE32B9C7FB387B4C7002 /* Pods */,
				0C3BC40E8058DBA858D75025 /* Frameworks */,
			);
""",
        f"""		97C146E51CF9000F007C117D = {{
			isa = PBXGroup;
			children = (
				9740EEB11CF90186004384FC /* Flutter */,
				97C146F01CF9000F007C117D /* Runner */,
				{IDS['watch_group']} /* ResilNetWatch */,
				97C146EF1CF9000F007C117D /* Products */,
				331C8082294A63A400263BE5 /* RunnerTests */,
				3443FE32B9C7FB387B4C7002 /* Pods */,
				0C3BC40E8058DBA858D75025 /* Frameworks */,
			);
""",
    )

    # Products
    text = text.replace(
        """		97C146EF1CF9000F007C117D /* Products */ = {
			isa = PBXGroup;
			children = (
				97C146EE1CF9000F007C117D /* Runner.app */,
				331C8081294A63A400263BE5 /* RunnerTests.xctest */,
			);
""",
        f"""		97C146EF1CF9000F007C117D /* Products */ = {{
			isa = PBXGroup;
			children = (
				97C146EE1CF9000F007C117D /* Runner.app */,
				331C8081294A63A400263BE5 /* RunnerTests.xctest */,
				{IDS['watch_app_ref']} /* ResilNetWatch.app */,
			);
""",
    )

    # Runner group: add bridge file
    text = text.replace(
        "				74858FAE1ED2DC5600515810 /* AppDelegate.swift */,\n",
        f"				74858FAE1ED2DC5600515810 /* AppDelegate.swift */,\n"
        f"				{IDS['bridge_file']} /* WatchConnectivityBridge.swift */,\n",
    )

    # Native target for watch
    native = f"""
		{IDS['watch_target']} /* ResilNetWatch */ = {{
			isa = PBXNativeTarget;
			buildConfigurationList = {IDS['cfg_list']} /* Build configuration list for PBXNativeTarget "ResilNetWatch" */;
			buildPhases = (
				{IDS['watch_sources']} /* Sources */,
				{IDS['watch_frameworks']} /* Frameworks */,
				{IDS['watch_resources']} /* Resources */,
			);
			buildRules = (
			);
			dependencies = (
			);
			name = ResilNetWatch;
			productName = ResilNetWatch;
			productReference = {IDS['watch_app_ref']} /* ResilNetWatch.app */;
			productType = "com.apple.product-type.application";
		}};
"""
    text = text.replace(
        "/* End PBXNativeTarget section */",
        native + "/* End PBXNativeTarget section */",
    )

    # Runner dependencies + embed phase
    text = text.replace(
        """			buildPhases = (
				7EA625338A7D4EC4AE5EBC2C /* [CP] Check Pods Manifest.lock */,
				9740EEB61CF901F6004384FC /* Run Script */,
				97C146EA1CF9000F007C117D /* Sources */,
				97C146EB1CF9000F007C117D /* Frameworks */,
				97C146EC1CF9000F007C117D /* Resources */,
				9705A1C41CF9048500538489 /* Embed Frameworks */,
				3B06AD1E1E4923F5004D2608 /* Thin Binary */,
				CB77CEA7AF728D595A97ED3E /* [CP] Embed Pods Frameworks */,
				EAA95EA88E5549B7CFF1F78D /* [CP] Copy Pods Resources */,
			);
			buildRules = (
			);
			dependencies = (
			);
			name = Runner;
""",
        f"""			buildPhases = (
				7EA625338A7D4EC4AE5EBC2C /* [CP] Check Pods Manifest.lock */,
				9740EEB61CF901F6004384FC /* Run Script */,
				97C146EA1CF9000F007C117D /* Sources */,
				97C146EB1CF9000F007C117D /* Frameworks */,
				97C146EC1CF9000F007C117D /* Resources */,
				9705A1C41CF9048500538489 /* Embed Frameworks */,
				{IDS['embed_phase']} /* Embed Watch Content */,
				3B06AD1E1E4923F5004D2608 /* Thin Binary */,
				CB77CEA7AF728D595A97ED3E /* [CP] Embed Pods Frameworks */,
				EAA95EA88E5549B7CFF1F78D /* [CP] Copy Pods Resources */,
			);
			buildRules = (
			);
			dependencies = (
				{IDS['dep']} /* PBXTargetDependency */,
			);
			name = Runner;
""",
    )

    # Project TargetAttributes + targets list
    text = text.replace(
        """					97C146ED1CF9000F007C117D = {
						CreatedOnToolsVersion = 7.3.1;
						LastSwiftMigration = 1100;
					};
				};
""",
        f"""					97C146ED1CF9000F007C117D = {{
						CreatedOnToolsVersion = 7.3.1;
						LastSwiftMigration = 1100;
					}};
					{IDS['watch_target']} = {{
						CreatedOnToolsVersion = 15.0;
					}};
				}};
""",
    )
    text = text.replace(
        """			targets = (
				97C146ED1CF9000F007C117D /* Runner */,
				331C8080294A63A400263BE5 /* RunnerTests */,
			);
""",
        f"""			targets = (
				97C146ED1CF9000F007C117D /* Runner */,
				331C8080294A63A400263BE5 /* RunnerTests */,
				{IDS['watch_target']} /* ResilNetWatch */,
			);
""",
    )

    # Resources phase
    resources = f"""
		{IDS['watch_resources']} /* Resources */ = {{
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				{IDS['build_assets']} /* Assets.xcassets in Resources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		}};
"""
    text = text.replace(
        "/* End PBXResourcesBuildPhase section */",
        resources + "/* End PBXResourcesBuildPhase section */",
    )

    # Sources phases
    sources = f"""
		{IDS['watch_sources']} /* Sources */ = {{
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				{IDS['build_app']} /* ResilNetWatchApp.swift in Sources */,
				{IDS['build_content']} /* ContentView.swift in Sources */,
				{IDS['build_session']} /* WatchSessionModel.swift in Sources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		}};
"""
    text = text.replace(
        "/* End PBXSourcesBuildPhase section */",
        sources + "/* End PBXSourcesBuildPhase section */",
    )

    # Add bridge to Runner sources
    text = text.replace(
        """		97C146EA1CF9000F007C117D /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				74858FAF1ED2DC5600515810 /* AppDelegate.swift in Sources */,
				1498D2341E8E89220040F4C2 /* GeneratedPluginRegistrant.m in Sources */,
				7884E8682EC3CC0700C636F2 /* SceneDelegate.swift in Sources */,
			);
""",
        f"""		97C146EA1CF9000F007C117D /* Sources */ = {{
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				74858FAF1ED2DC5600515810 /* AppDelegate.swift in Sources */,
				{IDS['bridge_build']} /* WatchConnectivityBridge.swift in Sources */,
				1498D2341E8E89220040F4C2 /* GeneratedPluginRegistrant.m in Sources */,
				7884E8682EC3CC0700C636F2 /* SceneDelegate.swift in Sources */,
			);
""",
    )

    # Target dependency
    dep = f"""
		{IDS['dep']} /* PBXTargetDependency */ = {{
			isa = PBXTargetDependency;
			target = {IDS['watch_target']} /* ResilNetWatch */;
			targetProxy = {IDS['dep_proxy']} /* PBXContainerItemProxy */;
		}};
"""
    text = text.replace(
        "/* End PBXTargetDependency section */",
        dep + "/* End PBXTargetDependency section */",
    )

    def watch_cfg(cfg_id: str, name: str) -> str:
        return f"""
		{cfg_id} /* {name} */ = {{
			isa = XCBuildConfiguration;
			buildSettings = {{
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				CLANG_ENABLE_MODULES = YES;
				CURRENT_PROJECT_VERSION = 1;
				DEVELOPMENT_TEAM = 8PS7CND77B;
				GENERATE_INFOPLIST_FILE = NO;
				INFOPLIST_FILE = ResilNetWatch/Info.plist;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/Frameworks",
				);
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.ajarnnarin.resilnet.watchkitapp;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SDKROOT = watchos;
				SKIP_INSTALL = YES;
				SWIFT_VERSION = 5.0;
				TARGETED_DEVICE_FAMILY = 4;
				WATCHOS_DEPLOYMENT_TARGET = 10.0;
			}};
			name = {name};
		}};
"""

    configs = (
        watch_cfg(IDS["cfg_debug"], "Debug")
        + watch_cfg(IDS["cfg_release"], "Release")
        + watch_cfg(IDS["cfg_profile"], "Profile")
    )
    text = text.replace(
        "/* End XCBuildConfiguration section */",
        configs + "/* End XCBuildConfiguration section */",
    )

    cfg_list = f"""
		{IDS['cfg_list']} /* Build configuration list for PBXNativeTarget "ResilNetWatch" */ = {{
			isa = XCConfigurationList;
			buildConfigurations = (
				{IDS['cfg_debug']} /* Debug */,
				{IDS['cfg_release']} /* Release */,
				{IDS['cfg_profile']} /* Profile */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		}};
"""
    text = text.replace(
        "/* End XCConfigurationList section */",
        cfg_list + "/* End XCConfigurationList section */",
    )

    # Ensure Debug configs for watch inherit SWIFT_OPTIMIZATION etc from project - OK

    PBX.write_text(text)
    print(f"Patched {PBX}")
    return 0


if __name__ == "__main__":
    sys.exit(main())

project "App"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++20"
   targetdir "Binaries/%{cfg.buildcfg}"
   staticruntime "off"

	targetname "Template"

   files { "Source/**.h", "Source/**.cpp", "Source/**.c" }

   includedirs
   {
      "Source",

	  -- Include Core
	  "../include/*/*"
	  "../include/*"
	  "../libs/*"
	  "../Core/Source"
   }
   
   -- libdirs{}

	-- link libraries Cores
   links
   {
      "Core"
   }

   targetdir ("../Binaries/" .. OutputDir .. "/%{prj.name}")
   objdir ("../Binaries/Intermediates/" .. OutputDir .. "/%{prj.name}")

   filter "system:windows"
       systemversion "latest"
       defines { "WINDOWS" } -- static point
	   
	linkoptions { "/SUBSYSTEM:WINDOWS", "/VERBOSE", "/MANIFEST:embed" }

   filter "configurations:Debug"
       defines { "DEBUG" }
       runtime "Debug"
       symbols "On"

   filter "configurations:Release"
       defines { "RELEASE" }
       runtime "Release"
       optimize "On"
       symbols "On"

   filter "configurations:Dist"
       defines { "DIST" }
       runtime "Release"
       optimize "On"
       symbols "Off"
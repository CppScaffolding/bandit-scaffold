-- scaffold geniefile for bandit

bandit_script = path.getabsolute(path.getdirectory(_SCRIPT))
bandit_root = path.join(bandit_script, "bandit")

bandit_includedirs = {
	path.join(bandit_script, "config"),
	bandit_root,
}

bandit_libdirs = {}
bandit_links = {}
bandit_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { bandit_includedirs }
	end,

	_add_defines = function()
		defines { bandit_defines }
	end,

	_add_libdirs = function()
		libdirs { bandit_libdirs }
	end,

	_add_external_links = function()
		links { bandit_links }
	end,

	_add_self_links = function()
		links { "bandit" }
	end,

	_create_projects = function()

project "bandit"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		bandit_includedirs,
	}

	defines {}

	files {
		path.join(bandit_script, "config", "**.h"),
		path.join(bandit_root, "**.h"),
		path.join(bandit_root, "**.cpp"),
	}

end, -- _create_projects()
}

---

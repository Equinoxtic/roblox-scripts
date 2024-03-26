--[[

    * Name:           EnvironmentLoader
    * Version:        1.0.0
    * Description:    A simple loader for environmental effects.
    * Author:         @Aeronoxtic
    * Date:           03/26/2024
    
    Documentation: TBA

]]

--[[

    Copyright 2024 @Aeronoxtic

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

]]


local module = {}


Services = {
    ["GameWorkspace"] = game.Workspace,
    ["Lighting"] = game:GetService("Lighting")
}


local ScriptUtilities = require(game:GetService("ReplicatedStorage").Utility:FindFirstChild("ScriptUtilities"))


ENVIRONMENT_VARIABLES = {
    "Atmosphere",
    "Sky"
}


ENVIRONMENT_SETTINGS = {
    
    -- Other Properties.
    
    ["ProcessDynamicClouds"] = true,
    
    
    -- Clouds Properties.
    
    ["Clouds"] = { -- Clouds Documentation: https://create.roblox.com/docs/reference/engine/classes/Clouds
        
        ["Cover"] = 0.5, -- Defines the cloud cover within the overall skyscape layer.
        ["Density"] = 0.7, -- Controls the particulate density of clouds.
        ["Color"] = Color3.fromRGB(255, 255, 255), -- Controls the material color of cloud particles.
        ["Enabled"] = true -- Toggles rendering of the Clouds object.
        
    },
    
    
    -- Atmosphere Properties.
    
    ["Atmosphere"] = { -- Atmosphere Documentation: https://create.roblox.com/docs/reference/engine/classes/Atmosphere
        
        ["Density"] = 0.4, -- Defines the amount of particles in the Atmosphere and essentially controls how much in-game objects/terrain will be obscured by them.
        ["Offset"] = 0, -- Controls how light transmits between the camera and the sky background.
        ["Color"] = Color3.fromRGB(199, 170, 107), -- Changes the Atmosphere hue for subtle environmental moods.
        ["Decay"] = Color3.fromRGB(92, 60, 13), -- When used with increased Atmosphere.Haze and Atmosphere.Glare, defines the hue of the Atmosphere away from the sun, gradually falling off from Atmosphere.Color towards this value.
        ["Glare"] = 0, -- When used with increased Atmosphere.Haze, specifies the glow/glare of the Atmosphere around the sun. More glare results in an increased effect of sunlight cast onto the sky and world.
        ["Haze"] = 0 -- Defines the haziness of the Atmosphere with a visible effect both above the horizon and into the distance.
        
    },
    
    
    -- Sky Properties
    
    ["Sky"] = { -- Sky Documentation: https://create.roblox.com/docs/reference/engine/classes/Sky
        
        ["CelestialBodiesShown"] = true, -- Sets whether the sun, moon, and stars will show.
        
        ["MoonAngularSize"] = 11, -- The perceived angular size of the moon while using this skybox, in degrees.
        ["MoonTextureId"] = "rbxasset://sky/moon.jpg", -- The texture of the moon while using this skybox.
        ["SunAngularSize"] = 21, -- The perceived angular size of the sun while using this skybox, in degrees.
        ["SunTextureId"] = "rbxasset://sky/sun.jpg", -- The texture of the sun while using this skybox.
        
        ["StarCount"] = 3000, -- How many stars are shown in the skybox.
        
        ["SkyboxBk"] = "rbxasset://textures/sky/sky512_bk.tex", -- The URL link to a picture for the back surface of the sky.
        ["SkyboxDn"] = "rbxasset://textures/sky/sky512_dn.tex", -- Asset ID for the bottom surface of the skybox.
        ["SkyboxFt"] = "rbxasset://textures/sky/sky512_ft.tex", -- Asset ID for the front surface of the skybox.
        ["SkyboxLf"] = "rbxasset://textures/sky/sky512_lf.tex", -- Asset ID for the left surface of the skybox.
        ["SkyboxRt"] = "rbxasset://textures/sky/sky512_rt.tex", -- Asset ID for the right surface of the skybox.
        ["SkyboxUp"] = "rbxasset://textures/sky/sky512_up.tex" -- Asset ID for the top surface of the skybox.
        
    }
    
}


--[[

    * Loads all of the present atmospheric effects in the ENVIRONMENT_VARIABLES table.
    
]]

module.loadEnvironmentAtmosphere = function()
    
    -- Loads the atmospheric environment.
    
    -- Check if ProcessDynamicClouds is set to true. This is for performance reasons.
    if ENVIRONMENT_SETTINGS.ProcessDynamicClouds == true then
        local cloudsInstance =
            Instance.new("Clouds")
        cloudsInstance.Parent = Services.GameWorkspace.Terrain
    end
    
    -- Load the ENVIRONMENT_VARIABLES instances.
    for i = 1, #ENVIRONMENT_VARIABLES do
        local currentInstance =
            Instance.new(ENVIRONMENT_VARIABLES[i])
        currentInstance.Parent = Services.Lighting
    end
    
    print("Loaded Atmospheric Effects !")
    
end


--[[
    
    * Loads the settings and the configuration for the atmospheric effects.
    
]]

module.loadEnvironmentSettings = function()
    
    -- Loads the environment settings (Refer to ENVIRONMENT_SETTINGS).
    
    -- Check if ProcessDynamicClouds is set to true.
    if ENVIRONMENT_SETTINGS.ProcessDynamicClouds == true then
        ScriptUtilities.setPropertyOf(Services.GameWorkspace.Terrain, "Clouds", ENVIRONMENT_SETTINGS.Clouds)
    end
    
    ScriptUtilities.setPropertyOf(Services.Lighting, "Atmosphere", ENVIRONMENT_SETTINGS.Atmosphere)
    ScriptUtilities.setPropertyOf(Services.Lighting, "Sky", ENVIRONMENT_SETTINGS.Sky)
    
    print("Loaded settings for Atmospheric Effects !")
    
end


return module

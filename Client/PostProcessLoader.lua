--[[

    * Name:           PostProcessLoader
    * Version:        1.0.31
    * Description:    A simple and lightweight post-processing effects loader.
    * Author:         @Aeronoxtic
    * Date:           03/19/2024
    
    Documentation: https://github.com/Equinoxtic/roblox-scripts/wiki/Client#postprocessingloader

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
    ["Lighting"] = game:GetService("Lighting")
}


local ScriptUtilities = require(game:GetService("ReplicatedStorage").Utility:FindFirstChild("ScriptUtilities"))


POST_PROCESSING_EFFECTS = {
    "BloomEffect",
    "BlurEffect",
    "ColorCorrectionEffect",
    "DepthOfFieldEffect",
    "SunRaysEffect"
}


POST_PROCESSING_SETTINGS = {

    -- Bloom Properties.

    ["BloomEffect"] = { -- BloomEffect Documentation: https://create.roblox.com/docs/reference/engine/classes/BloomEffect
        
        ["Intensity"] = 0.95, -- Determines the additive blending intensity.
        ["Size"] = 24, -- Determines the radius of the bloom in pixels.
        ["Threshold"] = 0.815, -- Determines how bright a color must be before it blooms.
        ["Enabled"] = true -- Toggles whether or not the PostEffect is enabled.
        
    },


    -- Blur Properties.

    ["BlurEffect"] = { -- BlurEffect Documentation: https://create.roblox.com/docs/reference/engine/classes/BlurEffect
        
        ["Size"] = 2, -- Determines the blur radius.
        ["Enabled"] = true -- Toggles whether or not the PostEffect is enabled.
        
    },


    -- Color Correction Properties.

    ["ColorCorrectionEffect"] = { -- ColorCorrectionEffect Documentation: https://create.roblox.com/docs/reference/engine/classes/ColorCorrectionEffect
        
        ["Brightness"] = 0, -- Determines by how much the brightness of pixel colors will be shifted.
        ["Contrast"] = 0.05, -- Determines the change in separation between the dark and light colors.
        ["Saturation"] = -0.025, -- Determines the change in intensity of colors.
        ["TintColor"] = Color3.fromRGB(255, 255, 255), -- Determines by how much the RGB channels of pixels are scaled.
        ["Enabled"] = true -- Toggles whether or not the PostEffect is enabled.
        
    },


    -- Depth Of Field (DOF) Properties.

    ["DepthOfFieldEffect"] = { -- DepthOfFieldEffect Documentation: https://create.roblox.com/docs/reference/engine/classes/DepthOfFieldEffect
        
        ["FarIntensity"] = 0.75, -- Intensity of the far field blur.
        ["FocusDistance"] = 0.05, -- Distance away from the camera where objects are in focus.
        ["InFocusRadius"] = 10, -- Controls the distance away from the FocusDistance where no blur is applied.
        ["NearIntensity"] = 0.75, -- Intensity of the near field blur.
        ["Enabled"] = true -- Toggles whether or not the PostEffect is enabled.
        
    },


    -- SunRays Properties.

    ["SunRaysEffect"] = { -- SunRaysEffect Documentation: https://create.roblox.com/docs/reference/engine/classes/SunRaysEffect
        
        ["Intensity"] = 0.25, -- Determines the opacity of the sun rays.
        ["Spread"] = 1, -- Determines how wide the sun rays will spread out.
        ["Enabled"] = true -- Toggles whether or not the PostEffect is enabled.
        
    }

}


--[[

    * Loads all of the present Post-Processing Effects in the ``POST_PROCESSING_EFFECTS`` table.

]]

module.loadPostProcessingEffects = function()

    -- Create new Instance for each Post-Processing Effect.

    for i = 1, #POST_PROCESSING_EFFECTS do
        local currentInstance = 
            Instance.new(POST_PROCESSING_EFFECTS[i])
        currentInstance.Parent = Services.Lighting
    end
    
    print("Loaded Post-Processing Effects !")

end


--[[

    * Loads the settings and the configurations for the Post-Processing Effects.

]]

module.loadPostProcessingSettings = function()

    -- Load Post-Processing Settings.

    ScriptUtilities.setPropertyOf(Services.Lighting, "BloomEffect", POST_PROCESSING_SETTINGS.BloomEffect)
    ScriptUtilities.setPropertyOf(Services.Lighting, "BlurEffect", POST_PROCESSING_SETTINGS.BlurEffect)
    ScriptUtilities.setPropertyOf(Services.Lighting, "ColorCorrectionEffect", POST_PROCESSING_SETTINGS.ColorCorrectionEffect)
    ScriptUtilities.setPropertyOf(Services.Lighting, "DepthOfFieldEffect", POST_PROCESSING_SETTINGS.DepthOfFieldEffect)
    ScriptUtilities.setPropertyOf(Services.Lighting, "SunRaysEffect", POST_PROCESSING_SETTINGS.SunRaysEffect)
    
    print("Loaded Settings for Post-Processing Effects !")

end


return module

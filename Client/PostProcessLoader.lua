--[[

    * Name:           PostProcessLoader
    * Version:        1.0.0
    * Description:    A simple and lightweight post-processing effects loader.
    * Author:         @Aeronoxtic
    * Date:           03/19/2024

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


local Services = {
    ["Lighting"] = game:GetService("Lighting")
}


local POST_PROCESSING_EFFECTS = {
    "BloomEffect",
    "BlurEffect",
    "ColorCorrectionEffect",
    "DepthOfFieldEffect",
    "SunRaysEffect"
}


local POST_PROCESSING_SETTINGS = {
    
    ["BloomEffect"] = {
        ["Intensity"] = 0.95,
        ["Size"] = 24,
        ["Threshold"] = 0.815,
        ["Enabled"] = true
    },
    
    ["BlurEffect"] = {
        ["Size"] = 2,
        ["Enabled"] = true
    },
    
    ["ColorCorrectionEffect"] = {
        ["Brightness"] = 0,
        ["Contrast"] = 0.05,
        ["Saturation"] = -0.025,
        ["TintColor"] = Color3.fromRGB(255, 255, 255),
        ["Enabled"] = true
    },
    
    ["DepthOfFieldEffect"] = {
        ["FarIntensity"] = 0.75,
        ["FocusDistance"] = 0.05,
        ["InFocusRadius"] = 10,
        ["NearIntensity"] = 0.75,
        ["Enabled"] = true
    },
    
    ["SunRaysEffect"] = {
        ["Intensity"] = 0.25,
        ["Spread"] = 1,
        ["Enabled"] = true
    }
    
}


local loadPostProcessingEffects = function()
    
    -- Create new Instance for each Post-Processing Effect.
    
    for i = 1, #POST_PROCESSING_EFFECTS do
        local currentInstance = 
            Instance.new(POST_PROCESSING_EFFECTS[i])
        currentInstance.Parent = Services.Lighting
    end
    
end


local setPostProcessingProperty = function(EFFECT, PROPERTIES)
    for PROPERTY, VALUE in PROPERTIES do
        Services.Lighting:FindFirstChildWhichIsA(EFFECT)[PROPERTY] = VALUE
    end 
end


local loadPostProcessingSettings = function()
    
    -- Load Post-Processing Settings.
    
    setPostProcessingProperty("BloomEffect", POST_PROCESSING_SETTINGS.BloomEffect)
    setPostProcessingProperty("BlurEffect", POST_PROCESSING_SETTINGS.BlurEffect)
    setPostProcessingProperty("ColorCorrectionEffect", POST_PROCESSING_SETTINGS.ColorCorrectionEffect)
    setPostProcessingProperty("DepthOfFieldEffect", POST_PROCESSING_SETTINGS.DepthOfFieldEffect)
    setPostProcessingProperty("SunRaysEffect", POST_PROCESSING_SETTINGS.SunRaysEffect)
    
end


loadPostProcessingEffects()


loadPostProcessingSettings()

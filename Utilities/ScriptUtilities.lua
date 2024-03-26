--[[

    * Name:           ScriptUtilities
    * Version:        1.0.0
    * Description:    A shared utility module for other scripts.
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


--[[

    * Sets the property of an instance in that specific class.
    * Iterates through a table of properties in an instance with ease.
    
    IMPORTANT: A table of properties must be provided in order to work.
    
]]

module.setPropertyOf = function(CLASS, INSTANCE, PROPERTIES)
    
    -- Sets the property of an Instance in a specific class. (i.e. Lighting.BlurEffect.Size)
    
    for PROPERTY, VALUE in PROPERTIES do
        CLASS:FindFirstChildWhichIsA(INSTANCE)[PROPERTY] = VALUE
    end 
    
end


return module

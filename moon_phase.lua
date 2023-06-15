local curl = require "cURL"

-- URL of the web page containing the moon phase information
-- local url = "https://example.com/moonphase"
local url =
"https://nineplanets.org/moon/phase/today/#:~:text=The%20current%20moon%20phase%20for%20today%20is%20the%20Waning%20Crescent%20phase."

-- Function to handle the response from the web page
local function handleResponse(data)
    -- Extract the moon phase from the response
    local moonPhase = data:match("Phase: (.-)<")

    print("Moon Phase:", moonPhase)
end

local easy = curl.easy()                            -- Create a new cURL easy handle
easy:setopt(curl.OPT_URL, url)                      -- Set the URL to fetch
easy:setopt(curl.OPT_WRITEFUNCTION, handleResponse) -- Set the callback function to handle the response
easy:perform()                                      -- Perform the request and capture the response
easy:close()                                        -- Clean up the easy handle

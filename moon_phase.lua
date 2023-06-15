-- Function to scrape the web page and extract the moon phase
local function getMoonPhase()
    local curl = require "cURL"

    -- URL of the web page containing the moon phase information
    local url =
    "https://nineplanets.org/moon/phase/today/#:~:text=The%20current%20moon%20phase%20for%20today%20is%20the%20Waning%20Crescent%20phase."

    local moonPhase
    local moonAge
    local moonIllumination
    local moonSign

    local function handleResponse(data)
        -- Function to handle the response from the web page
        -- Extract the moon phase from the response
        moonPhase = data:match("Phase: (.-)<")
        moonAge = data:match("Moon age: (.-)<")
        moonIllumination = data:match("Moon illumination: (.-)<")
        moonSign = data:match("moon sign is (.-)<")
    end

    local easy = curl.easy()                            -- Create a new cURL easy handle
    easy:setopt(curl.OPT_URL, url)                      -- Set the URL to fetch
    easy:setopt(curl.OPT_WRITEFUNCTION, handleResponse) -- Set the callback function to handle the response
    easy:perform()                                      -- Perform the request and capture the response
    easy:close()                                        -- Clean up the easy handle
    return moonPhase, moonAge, moonIllumination, moonSign
end

local moonPhase, moonAge, moonIllumination, moonSign = getMoonPhase()
print("Moon Phase         :", moonPhase)
print("Moon Age           :", moonAge)
print("Moon Illumination  :", moonIllumination)
print("Moon Sign          :", moonSign)

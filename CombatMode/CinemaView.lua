-- Create the main frame for the cinema view
-- We use BACKGROUND strata to keep it behind most UI elements but over the world
local CinemaFrame = CreateFrame("Frame", "CombatModeCinemaViewFrame", UIParent)
CinemaFrame:SetFrameStrata("BACKGROUND")
CinemaFrame:SetAllPoints(UIParent)

-- Table defining the four corner textures and their anchor points
-- We stretch each texture from its respective corner to the center of the screen
-- This ensures they fit the entire screen based on resolution automatically
local textures = {
  {
    atlas = "bank-frame-shadow-cornertopleft",
    anchor = "TOPLEFT",
    relative = "BOTTOMRIGHT"
  },
  {
    atlas = "bank-frame-shadow-cornertopright",
    anchor = "TOPRIGHT",
    relative = "BOTTOMLEFT"
  },
  {
    atlas = "bank-frame-shadow-cornerbottomleft",
    anchor = "BOTTOMLEFT",
    relative = "TOPRIGHT"
  },
  {
    atlas = "bank-frame-shadow-cornerbottomright",
    anchor = "BOTTOMRIGHT",
    relative = "TOPLEFT"
  }
}

for _, data in ipairs(textures) do
  local texture = CinemaFrame:CreateTexture(nil, "ARTWORK")
  texture:SetAtlas(data.atlas)
  
  -- Anchor the texture to its corner
  texture:SetPoint(data.anchor, CinemaFrame, data.anchor)
  
  -- Stretch the texture to the center of the screen
  texture:SetPoint(data.relative, CinemaFrame, "CENTER")
end

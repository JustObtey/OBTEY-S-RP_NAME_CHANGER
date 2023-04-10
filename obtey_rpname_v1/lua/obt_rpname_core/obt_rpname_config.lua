OBTConfig = OBTConfig or {} -- DO NOT TOUCH THIS


OBTConfig.BGColor = Color(46, 39, 66)                   -- General background color
OBTConfig.EntryColor = Color(57, 48, 83)                -- Must be a little bit darker than BGColor
OBTConfig.FadeToColor = Color(46, 39, 66)               -- This must be identic to OBTConfig.BGColor

OBTConfig.NPCDisplayText = true                           -- Set if yes or no OBTConfig.NPCText should be displayed on top of the npc head 
OBTConfig.NPCModel = "models/mossman.mdl"                 -- Define the model of the NPC
OBTConfig.NPCText = "RP Name"                             -- Text to display on top of the npc head

OBTConfig.Title = "Please enter a valid RP name"          -- Text to display as title
OBTConfig.NickEntry = "Write your first name here"        -- Text to display in the First name entry
OBTConfig.NameEntry = "Write your last name here"         -- Text to display in the Last name entry
OBTConfig.Submit = "Submit"                               -- Text to display inside of the Submit button

OBTConfig.NulError = "Please enter your name"             -- Text to display in case of the player didn't wrote anything
OBTConfig.NickError = "Your first name is too short"      -- Text to display as First name too short error
OBTConfig.NameError = "Your last name is too short"       -- Text do display as Last name too short error

OBTConfig.FirstNameMaxChar = 13                           -- First name max characters
OBTConfig.LastNameMaxChar = 13                            -- Last name max characters
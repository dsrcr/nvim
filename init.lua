-- ________     _________                        _____ .__    ____   
-- \______ \   /   _____/  ____   ____    ____ _/ ____\|__|  / ___\  
--  |    |  \  \_____  \ _/ ___\ /  _ \  /    \\   __\ |  | / /_/  > 
--  |    `   \ /        \\  \___(  <_> )|   |  \|  |   |  | \___  /  
-- /_______  //_______  / \___  >\____/ |___|  /|__|   |__|/_____/   
--         \/         \/      \/             \/                      
-- Starting point for my neovim setup
-- https://github.com/dsrcr/nvim   

--Open this file if you want to add new plugins
require("config.packer")

-- You can find here stuff related to lsp
require("config.lsp")

-- You can customize editor
require("config.editor")

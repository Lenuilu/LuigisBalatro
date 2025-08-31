-- Config Tab
SMODS.current_mod.config_tab = function()
  return {
    n = G.UIT.ROOT,
    config = { align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK },
    nodes = {
	
		{
			n = G.UIT.R,
			config = {
			padding = 0.25,
			align = "cm"
			},
			nodes = {
				{
					n = G.UIT.T,
					config = {
					text = "Restart Required",
					shadow = true,
					scale = 0.75 * 0.8,
					colour = HEX("d80007")
					},
				},
			},
		},
		{
			n = G.UIT.R,
			config = { align = 'cl', tooltip = {text = {"Changes card whites to be blue."}},},
			nodes = {
				{
					n = G.UIT.C,
					-- config = { align = 'cm'},
					nodes = {
					create_toggle {
						label = "Blue Card",
						ref_table = LPB_config,
						ref_value = 'luigicbase'
						},
					},
				},
			},
		},
		{
			n = G.UIT.R,
			config = { align = 'cl', tooltip = {text = {"Changes deck UI images for suits."}},},
			nodes = {
				{
					n = G.UIT.C,
					-- config = { align = 'cm'},
					nodes = {
					create_toggle {
						label = "Custom Suits UI",
						ref_table = LPB_config,
						ref_value = 'luigicustomsuits'
						},
					},
				},
			},
		},
		{
			n = G.UIT.R,
			config = { tooltip = {text = {"Adds custom quips."}},},
			nodes = {
				{
					n = G.UIT.C,
					nodes = {
					  create_toggle {
						label = "Quips",
						ref_table = LPB_config,
						ref_value = 'luigiquips'
						},
					},
				},
			}
		},
		
    }
  }
end

-- Credits Tab
SMODS.current_mod.extra_tabs = function()
  local scale = 0.75
  return {
    label = "Credits",
    tab_definition_function = function()
      return {
        n = G.UIT.ROOT,
        config = {
          align = "cm",
          padding = 0.05,
          colour = G.C.CLEAR,
        },
        nodes = {
			{
				n = G.UIT.R,
				config = {
				  padding = 0,
				  align = "cm"
				},
				nodes = {
					{
						n = G.UIT.T,
						config = {
						  text = "Thanks to",
						  shadow = true,
						  scale = scale * 0.8,
						  colour = G.C.UI.TEXT_LIGHT
						}
					}
				}
			},
			{
				n = G.UIT.R,
				config = {
				  padding = 0,
				  align = "cm"
            },
            nodes = {
				{
					n = G.UIT.T,
					config = {
					  text = "Developers: ",
					  shadow = true,
					  scale = scale * 0.8,
					  colour = G.C.UI.TEXT_LIGHT
					}
				},
				{
					n = G.UIT.T,
					config = {
					  text = "Lenuilu & V--R",
					  shadow = true,
					  scale = scale * 0.8,
					  colour = HEX("d80007")
					}
				}
            }
        },
			{
				n = G.UIT.R,
				config = {
					padding = 0,
					align = "cm"
            },
            nodes = {
				{
					n = G.UIT.T,
					config = {
						text = "Special Thanks: ",
						shadow = true,
						scale = scale * 0.8,
						colour = G.C.UI.TEXT_LIGHT
					}
				},
				{
					n = G.UIT.T,
					config = {
						text = "Marie (Maratby), Marziks,",
						shadow = true,
						scale = scale * 0.8,
						colour = HEX("d80007")
					}
				}
            }
			},
		    {
				n = G.UIT.R,
				config = {
				  padding = 0,
				  align = "cm"
				},
				nodes = {
					{
						n = G.UIT.T,
						config = {
						  text = "",
						  shadow = true,
						  scale = scale * 0.8,
						  colour = G.C.UI.TEXT_LIGHT
						}
					},
					{
						n = G.UIT.T,
						config = {
							text = "Fytos ...and you!",
							shadow = true,
							scale = scale * 0.8,
							colour = HEX("d80007")
						}
					}
				}
			},
			{
				n = G.UIT.R, config = { padding = 0, align = "cm", -- colour = G.C.BLUE 
				},
				nodes = {
					{
						n = G.UIT.C, config = { padding = 0.2, align = "cl", -- colour = G.C.RED 
						},
						nodes = {
							UIBox_button({
							-- minw = 3.85,
							colour = HEX("d80007"),
							button = "vrgithub",
							label = {"Github"}
							}),
						},
					},
					{
						n = G.UIT.C, config = { padding = 0.2, align = "cr", -- colour = G.C.YELLOW
						},
						nodes = {
						  UIBox_button({
							-- minw = 3.85,
							colour = HEX("f5d985"),
							button = "vrdonate",
							label = {"Donate"}
							})
						},
					},
				},
			},
		},
      }
    end
  }
end

-- Functions

function G.FUNCS.vrgithub(e)
	love.system.openURL("https://github.com/Lenuilu/LuigisBalatro")
end
function G.FUNCS.vrdonate(e)
  love.system.openURL("https://ko-fi.com/vrart1")
end
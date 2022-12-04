local alpha_ok, alpha = pcall(require, "alpha")

if not alpha_ok then
	print("Missing Alpha")
	return
end

local dashboard = require("alpha.themes.dashboard")

local ascii_art = {
	{
		[[⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣭⣑⠒⠦⠤⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⢀⣀⡸⠿⠿⣿⣿⣷⣦⣤⣄⣈⡉⠛⠲⢤⣀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠲⢾⣿⣿⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣦⠈⢷⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠈⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠿⣿⠋⢿⣇⡈⡇⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⢹⡟⠀⠀⠀⠀⠘⣿⣿⢹⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⠈⠧⣀⠀⠀⡠⠂⠃⣿⡞⡄⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⢀⣾⣿⡟⢿⣿⣿⣿⡿⠘⠿⠃⠀⠀⠈⠙⠛⢿⣷⡃⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⢸⣿⢿⣧⠸⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⢹⡇⠛⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣷⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢀⣼⡇⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠘⠟⠁⢿⣿⣿⣧⠄⠀⡀⢀⡰⠖⠒⢿⣿⡇⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⢸⣁⡽⢿⣀⣐⠡⠂⠱⡄⠀⠀⠙⠇⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⣮⣏⡅⠀⠀⢠⡇⠀⠀⠀⠟⠁⠀⠀⣰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠏⠶⡄⠀⢀⣀⡟⣦⣀⢸⣀⣀⣠⣾⣯⠕⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⣧⢲⠇⢸⡇⣚⣿⣿⣿⣯⣿⣿⣶⣶⡾⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⡶⠺⡃⠀⠱⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⣶⠭⠅⠀⠻⢻⢼⣿⣿⣿⣿⣿⣿⣿⣿⡘⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⣏⣚⠁⠀⠀⣸⣼⣿⣿⠟⠉⠻⣿⣿⡿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⣯⢭⡇⠀⠀⢸⣻⣿⠁⠀⠀⠀⠈⢻⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	},
	{
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⢼⡦⠒⠒⠒⠒⠒⠢⠤⢄⠘⠙⠛⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⣀⡔⠍⠛⠺⣿⠒⠀⢀⠀⠀⠀⠀⠀⠉⠢⡀⠀]],
		[[⠀⠀⢠⣺⣤⣠⡞⡁⠐⠀⠉⠁⠂⠈⠉⠀⠃⠀⠀⠀⢀⠀⠀⠘⡄]],
		[[⠀⠀⠘⣿⣿⡟⡈⠀⢠⠀⠀⢀⠐⢄⠀⠀⠀⡀⠀⠀⠸⠀⠀⠀⠘]],
		[[⠀⠀⠀⢹⣿⡟⡄⠀⣼⠀⢰⢸⣰⣀⣢⡀⠀⡇⠀⠀⠀⠀⠀⠀⢀]],
		[[⠀⠀⠀⢸⣿⡇⣿⡀⢃⠀⢠⣿⣻⣤⣤⠬⢦⡇⠀⠀⠀⣦⠀⠀⠈]],
		[[⠀⠀⠀⣿⣿⡇⣇⣇⢸⠣⠸⣻⠙⠿⢷⡤⠞⢀⠀⠀⠀⣿⠒⠑⠄]],
		[[⠀⠀⠀⣿⣿⠃⢯⣿⡉⠀⠂⡟⠀⠉⠁⠀⠀⢸⠀⠀⠀⣿⠀⢠⠀]],
		[[⠀⠀⠀⣿⣿⠀⢰⠙⠋⠅⠀⠀⠀⠀⠀⠀⠀⠈⡆⠀⠀⣿⠀⢊⠃]],
		[[⠀⠀⢸⣿⣿⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃⠀⠀⢻⠁⠀⠀]],
		[[⠀⠀⢸⣿⣿⠀⡇⢧⠀⠀⠀⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠇⠀]],
		[[⠀⠀⢸⣿⣿⢀⠇⣾⣷⣄⠀⠀⠀⠀⠀⢀⠤⠐⢸⠀⠀⢸⢰⠀⠀]],
		[[⠀⠀⣿⣿⣿⢸⠀⣿⣿⣿⣷⣤⣤⠐⠉⠀⠀⠀⠀⡇⠀⢸⢸⠀⠀]],
		[[⠀⠀⣿⣿⣿⢸⢠⣿⣿⣿⣿⣿⡇⠈⠙⠒⢤⠒⠉⠸⠀⢸⢸⠀⠀]],
		[[⠀⠀⣿⣿⣿⣿⢸⣿⣿⣿⡿⠻⠀⠀⠀⠀⣴⠀⠀⠀⠇⢸⢸⠀⠀]],
		[[⣿⣿⣿⠛⠛⠏⣼⠙⢚⣋⠔⠁⠀⠀⠀⢠⣿⡇⠀⠀⢀⢸⢽⣶⣄]],
		[[⣿⣿⣿⢠⣶⣦⢹⣿⣇⠀⠀⠀⠀⠀⠀⣿⣿⣿⡄⠀⠘⠈⠀⢑⣦]],
		[[⣿⣿⣿⢸⣿⣿⡎⣿⣿⠀⠀⠀⠀⠀⠀⢹⣿⣟⠀⠀⠀⢣⠆⢸⣿]],
		[[⣿⣿⣿⢸⣿⣿⣷⣿⢿⠀⠀⠀⠀⠀⢠⣿⣿⣿⡆⠀⠀⠀⢎⡼⣿]],
		[[⣿⣿⣿⣸⣙⠻⡿⡏⣾⣶⣦⣤⣀⣀⣾⣿⣿⣿⣿⣄⣀⣠⣼⣹⢞]],
		[[⣿⣿⣿⣷⣬⡳⠴⣳⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢫]],
		[[⣿⣿⣿⣿⣿⣿⣶⣿⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣞]],
	},
	{
		[[⡟⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⢉⣉⣹⣿⣿⣿⣿⣿⣿⣉⣉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⣉⠉⠻⣿⣿]],
		[[⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡇⠀⠀⢻]],
		[[⣷⡤⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠒⠀⢸]],
		[[⡏⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣶⣶⣶⣦⡄⠀⠀⠀⠀⠀⠀⢸]],
		[[⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣭⡙⢿⣷⠀⠀⠀⠀⠀⠀⢸]],
		[[⡇⠀⠀⠀⠀⠀⠀⢀⣸⣿⣿⣿⠉⠉⠙⠛⣿⠛⠋⠙⣿⣿⣿⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠇⠀⠀⠀⠀⠀⢸]],
		[[⡇⠀⠀⠀⠀⠀⢀⣿⡿⣻⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠉⣿⣿⠘⢻⡏⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⢸]],
		[[⡇⠀⠀⠀⠀⠀⢸⡏⠁⣿⣀⣉⣿⣀⣀⣀⠀⠀⣀⣀⣀⣈⣿⣇⣸⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⢸]],
		[[⡇⠀⠀⠀⠀⠀⢸⡇⠀⢿⣿⣿⣿⣿⣿⣿⡇⠸⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⢿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⣸]],
		[[⡇⠀⠀⠀⠀⠀⠘⢇⣀⢸⣿⡷⠠⠾⠟⢻⠃⠀⠈⠃⠀⠠⠾⠿⠟⠃⢻⡿⠛⢰⡶⠆⢸⠛⠛⠁⠀⠀⠀⠀⠀⠀⠀⠠⣿]],
		[[⡇⠀⠀⠀⠀⠀⠀⠀⠀⠈⡟⠀⠀⠀⢀⡸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡞⠃⠀⡸⠇⢰⣿⣇⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸]],
		[[⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣧⡀⠀⠀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⢀⣴⠋⢿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸]],
		[[⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠈⠑⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⣾⣿⣿⠀⠀⣯⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸]],
		[[⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢱⠀⠀⠲⢶⡶⠶⠶⠖⠂⠀⠀⠀⠀⣠⢾⣿⣿⢹⣿⣶⢠⠗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸]],
		[[⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⡄⠀⠀⠉⠉⠁⠀⠀⠀⠀⣠⣾⠃⢸⣿⠛⠀⠙⠻⠶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸]],
		[[⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⣦⡀⠀⠀⠀⢀⣀⣤⣾⡟⠀⠀⢸⣟⣦⣄⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸]],
		[[⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣬⣽⣶⣶⣶⣿⠋⠉⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣷⣶⣦⣤⣀⡀⠀⠀⠀⠀⠀⠀⢸]],
		[[⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠈⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⢸]],
		[[⡇⠀⠀⠀⠀⠀⠀⢀⣀⣾⣿⣿⣿⣿⣿⣿⣿⠿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⢸]],
		[[⡇⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⡿⠿⠟⠀⠀⠀⠀⠀⠀⠀⣀⣀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⢸]],
		[[⡇⠀⠀⠀⣤⣿⣿⣿⣿⣿⣿⣿⣿⡿⠻⠷⠤⠄⢀⠤⠤⠤⠜⠛⣩⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⡀⠀⢸]],
		[[⡇⠀⢠⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⣶⣬⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⢸]],
	},
	{
		[[                                 ]],
		[[     ████               ████     ]],
		[[    ███                   ███    ]],
		[[   ███                     ██    ]],
		[[  ███                       ███  ]],
		[[ ███                         ███ ]],
		[[████                         ████]],
		[[████                         ████]],
		[[██████       ███████       ██████]],
		[[█████████████████████████████████]],
		[[█████████████████████████████████]],
		[[ ███████████████████████████████ ]],
		[[  ████ ███████████████████ ████  ]],
		[[       ███▀███████████▀███       ]],
		[[      ████──▀███████▀──████      ]],
		[[      █████───█████───█████      ]],
		[[      ███████▄█████▄███████      ]],
		[[       ███████████████████       ]],
		[[        █████████████████        ]],
		[[         ███████████████         ]],
		[[          █████████████          ]],
		[[           ███████████           ]],
		[[          ███──▀▀▀──███          ]],
		[[          ███─█████─███          ]],
		[[           ███─███─███           ]],
		[[            █████████            ]],
	},
	{
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⣿⣿⣿⣤⡀⢀⣤⣤⠀⢀⣠⣴⣶⣦⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣻⣿⣿⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⡿⠟⠉⠉⠉⠉⠙⠛⠿⣿⣿⣿⣿⣟⣶⣾⡏⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⡿⣻⡿⠔⠒⠓⠀⠀⠀⠀⠒⠒⢼⣿⣿⣿⢹⣟⣿⡄⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⢁⣠⣀⣤⡀⠀⠀⠀⠄⣀⣀⡟⢿⣿⣾⣿⣿⣷⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⢸⣿⣯⠟⣁⣈⡙⠇⠀⠀⠐⠛⢫⠙⠻⣾⣿⣿⣽⡷⣽⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣨⣿⡿⢾⣷⣶⣿⠀⠀⠀⢠⣿⣤⣽⡄⠸⣿⡿⠿⢇⠈⢳⣆]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣗⢻⡇⠈⠛⠛⠁⠀⠀⠀⠈⠛⠻⠟⠁⢠⣿⣷⣴⡈⡇⠀⠁]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢯⣹⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⡗⣱⠃⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⡟⣦⠀⠀⠀⠀⠲⠀⠀⠀⠀⠀⣰⣿⢿⣿⣿⠁⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣧⣿⣷⢦⡀⠀⠀⠀⢀⣀⡤⢚⣿⣿⣾⠋⣿⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠁⢿⡿⣿⣷⣌⡓⠒⠊⢉⣀⣴⣿⣿⡟⢿⠀⠈⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠃⣸⣿⣿⣿⠀⣾⣿⣿⣿⣿⡿⣄⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡔⢁⣿⣿⡿⣴⣿⣿⣿⣯⡾⠀⠈⢷⡄⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠋⠀⣸⢿⣽⡿⠻⣿⣿⣿⣿⠇⠀⠀⠀⡿⣆⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠇⠀⣠⣿⣸⣿⣤⣴⣿⣿⣿⣿⠀⠀⠀⢰⠀⠘⡆⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠋⢀⣴⣿⣿⢿⣿⣿⣿⣿⠀⣀⡏⠀⠀⠀⢸⠀⠀⢸⡀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡏⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⣤⡇⠀⠀⠀⡜⠀⣠⠋⣧⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠁⢿⣿⣿⣿⣿⣇⢀⣯⣿⣿⣿⣿⠀⠀⠀⠀⡇⡴⡇⠀⢸⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠎⡞⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⢀⠏⢀⠇⠀⢸⡄⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡎⢀⡷⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⡎⠀⢸⠀⠀⠀⡇⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠀⢸⠑⢀⣾⣧⣿⣿⣿⣿⡀⢨⣿⣿⣿⣿⠃⠀⡜⠀⠀⡸⠀⠀⠀⣿⡄]],
	},
	{
		[[⠤⣤⣤⣤⣄⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣠⣤⠤⠤⠴⠶⠶⠶⠶]],
		[[⢠⣤⣤⡄⣤⣤⣤⠄⣀⠉⣉⣙⠒⠤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠴⠘⣉⢡⣤⡤⠐⣶⡆⢶⠀⣶⣶⡦]],
		[[⣄⢻⣿⣧⠻⠇⠋⠀⠋⠀⢘⣿⢳⣦⣌⠳⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠞⣡⣴⣧⠻⣄⢸⣿⣿⡟⢁⡻⣸⣿⡿⠁]],
		[[⠈⠃⠙⢿⣧⣙⠶⣿⣿⡷⢘⣡⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣷⣝⡳⠶⠶⠾⣛⣵⡿⠋⠀⠀]],
		[[⠀⠀⠀⠀⠉⠻⣿⣶⠂⠘⠛⠛⠛⢛⡛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠛⠀⠉⠒⠛⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⢸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⢻⡁⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	},
	{
		[[⠀⠀⡶⠛⠲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡶⠚⢶⡀⠀]],
		[[⢰⠛⠃⠀⢠⣏⠀⠀⠀⠀⣀⣠⣤⣤⣤⣤⣤⣤⣄⣀⡀⠀⠀⠀⣸⠇⠀⠈⠙⣧]],
		[[⠸⣦⣤⣄⠀⠙⢷⣤⣶⠟⠛⢉⣁⣤⣤⣤⣤⣀⣉⠙⠻⢷⣤⡾⠋⢀⣤⣤⣴⠏]],
		[[⠀⠀⠀⠈⠳⣤⡾⠋⣀⣴⣿⣿⠿⠿⠟⠛⠿⠿⣿⣿⣶⣄⠙⢿⣦⠟⠁⠀⠀⠀]],
		[[⠀⠀⠀⢀⣾⠟⢀⣾⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣷⡄⠹⣷⡀⠀⠀⠀]],
		[[⠀⠀⠀⣾⡏⢠⣿⣿⡯⠤⠤⠤⠒⠒⠒⠒⠒⠒⠒⠤⠤⠽⣿⣿⡆⠹⣷⡀⠀⠀]],
		[[⠀⠀⢸⣟⣠⡿⠿⠟⠒⣒⣒⣉⣉⣉⣉⣉⣉⣉⣉⣉⣒⣒⡛⠻⠿⢤⣹⣇⠀⠀]],
		[[⠀⠀⣾⡭⢤⣤⣠⡞⠉⠁⢀⣀⣀⠀⠀⠀⠀⢀⣀⣀⠀⠈⢹⣦⣤⡤⠴⣿⠀⠀]],
		[[⠀⠀⣿⡇⢸⣿⣿⣇⠀⣼⣿⣿⣿⣷⠀⠀⣼⣿⣿⣿⣷⠀⢸⣿⣿⡇⠀⣿⠀⠀]],
		[[⠀⠀⢻⡇⠸⣿⣿⣿⡄⢿⣿⣿⣿⡿⠀⠀⢿⣿⣿⣿⡿⢀⣿⣿⣿⡇⢸⣿⠀⠀]],
		[[⠀⠀⠸⣿⡀⢿⣿⣿⣿⣆⠉⠛⠋⠀⢴⣶⠀⠉⠛⠉⣠⣿⣿⣿⡿⠀⣾⠇⠀⠀]],
		[[⠀⠀⠀⢻⣷⡈⢻⣿⣿⣿⣿⣶⣤⣀⣈⣁⣀⡤⣴⣿⣿⣿⣿⡿⠁⣼⠏⠀⠀⠀]],
		[[⠀⠀⠀⢀⣽⣷⣄⠙⢿⣿⣿⡟⢲⠧⡦⠼⠤⢷⢺⣿⣿⡿⠋⣠⣾⢿⣄⠀⠀⠀]],
		[[⣰⠟⠛⠛⠁⣨⡿⢷⣤⣈⠙⢿⡙⠒⠓⠒⠒⠚⡹⠛⢁⣤⣾⠿⣧⡀⠙⠋⠙⣆]],
		[[⠹⣤⡀⠀⠐⡏⠀⠀⠉⠛⠿⣶⣿⣶⣤⣤⣤⣾⣷⠾⠟⠋⠀⠀⢸⡇⠀⢠⣤⠟]],
		[[⠀⠀⠳⢤⠾⠃⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠘⠷⠤⠾⠁⠀]],
	},
}

--https://emojicombos.com/anime

local random = math.random(1, #ascii_art)

dashboard.section.header.val = ascii_art[random]

dashboard.section.buttons.val = {
	dashboard.button("e", " New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", " Find file", ":Telescope find_files <CR>"),
	dashboard.button("r", " Recent file", ":Telescope oldfiles <CR>"),
	dashboard.button("c", "漣Configuration", ":e ~/.config/nvim <CR>"),
	dashboard.button("q", " Quit", ":q <CR>"),
}

alpha.setup(dashboard.config)

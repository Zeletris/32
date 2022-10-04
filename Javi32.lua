script_functions = { -- table(76e0e45)
	['ARM7'] = { -- table(93499a)
		[1] = { -- table(2a7e2b6)
			['edits'] = { -- table(7532bb7)
				[1] = { -- table(c458f24)
					[1] = '0x104CE94',
					[2] = '~A MOV R0, #1',
					[3] = true,
					[4] = 'public abstract class IngameMain : MonoBehaviour, ISyncData ',
					[5] = '	protected bool get_IsEnemyAnnihilation() { }',
					[6] = '0x104CE94',
				},
				[2] = { -- table(5131a8d)
					[1] = '0x18136F0',
					[2] = '~A MOV R0, #0',
					[3] = true,
					[4] = 'public class IngameTurnManager : MonoBehaviour ',
					[5] = '	public bool get_IsPlayingManager() { }',
					[6] = '0x18136F0',
				},
				[3] = { -- table(1477442)
					[1] = '0x1DF95F8',
					[2] = '~A NOP {0}',
					[3] = true,
					[4] = 'public sealed class IngameStatisticsManager : MonoBehaviour_SyncData_Auto ',
					[5] = '	public void GetBattleAbuseLog(ref Dictionary<string, object> dictAbuse, ref Dictionary<string, object> dictSimul, bool isWin, Nullable<int> continueCount, Nullable<int> allyTeamPower, bool isSimul = False) { }',
					[6] = '0x1DF95F8',
				},
				[4] = { -- table(de4cc53)
					[1] = '0x1DF9790',
					[2] = '~A NOP {0}',
					[3] = true,
					[4] = 'public sealed class IngameStatisticsManager : MonoBehaviour_SyncData_Auto ',
					[5] = '	public void SendBattleAbuseLog(bool isWin, Nullable<int> continueCount, Nullable<int> allyTeamPower) { }',
					[6] = '0x1DF9790',
				},
			},
			['name'] = 'Instant Win',
		},
		[2] = { -- table(bde7990)
			['edits'] = { -- table(c23d289)
				[1] = { -- table(45c928e)
					[1] = '0x1D8BDBC',
					[2] = '~A MVN R0, #99',
					[3] = true,
					[4] = 'public class MonsterData ',
					[5] = '	public virtual int get_Level() { }',
					[6] = '0x1D8BDBC',
				},
				[2] = { -- table(7e5daaf)
					[1] = '0x1DF95F8',
					[2] = '~A NOP {0}',
					[3] = true,
					[4] = 'public sealed class IngameStatisticsManager : MonoBehaviour_SyncData_Auto ',
					[5] = '	public void GetBattleAbuseLog(ref Dictionary<string, object> dictAbuse, ref Dictionary<string, object> dictSimul, bool isWin, Nullable<int> continueCount, Nullable<int> allyTeamPower, bool isSimul = False) { }',
					[6] = '0x1DF95F8',
				},
				[3] = { -- table(7d99ebc)
					[1] = '0x1DF9790',
					[2] = '~A NOP {0}',
					[3] = true,
					[4] = 'public sealed class IngameStatisticsManager : MonoBehaviour_SyncData_Auto ',
					[5] = '	public void SendBattleAbuseLog(bool isWin, Nullable<int> continueCount, Nullable<int> allyTeamPower) { }',
					[6] = '0x1DF9790',
				},
			},
			['name'] = 'God Mode/One Hit',
		},
	},
}
generated_script_title = "7DS Script by Zeletris"
target_process = "com.netmarble.nanagb"
target_name = "7DS"
arch = gg.getTargetInfo()
if gg.getTargetPackage() ~= target_process then
gg.alert("This script was written for "..target_name.." ("..target_process..") but you are attached to "..arch.label.." ("..gg.getTargetPackage().."). Attach to the correct process and try again.")
os.exit()
end
function getlib_1()
	lib_size = 0
	lib_index = ""
	for i,v in pairs(gg.getRangesList("libil2cpp.so")) do
		if v["end"] - v["start"] > lib_size and v["state"] == "Xa" then
			lib_size = v["end"] - v["start"]
			lib_index = i
		end
	end
	BASEADDR = gg.getRangesList("libil2cpp.so")[lib_index].start
end

function getlib_2()
	lib_size = 0
	lib_index = ""
	for i,v in pairs(gg.getRangesList("split_config.armeabi_v7a.apk")) do
		if v["end"] - v["start"] > lib_size and v["state"] == "Xa" then
			lib_size = v["end"] - v["start"]
			lib_index = i
		end
	end
	BASEADDR = gg.getRangesList("split_config.armeabi_v7a.apk")[lib_index].start
end

function getlib_3()
	lib_size = 0
	lib_index = ""
	for i,v in pairs(gg.getRangesList("split_config.arm64_v8a.apk")) do
		if v["end"] - v["start"] > lib_size and v["state"] == "Xa" then
			lib_size = v["end"] - v["start"]
			lib_index = i
		end
	end
	BASEADDR = gg.getRangesList("split_config.arm64_v8a.apk")[lib_index].start
end

if pcall(getlib_1) == false then
	if pcall(getlib_2) == false then
		getlib_3()
	end
end

original_values = {}
active_array = {}
if arch.x64 == true then
	end_bool = "C0035FD6r"
	file_ext = "ARM8"
else
	end_bool = "1EFF2FE1r"
	file_ext = "ARM7"
end
	
function get_original_values(func_index)
	local temp_table = {}
		for i,v in pairs(script_functions[file_ext][func_index].edits) do
			if script_functions[file_ext][func_index]["edits"][i][3] == false then
				temp_table[1] = {}
				temp_table[1].address = script_functions[file_ext][func_index]["edits"][i][1] + BASEADDR 
				temp_table[1].flags = gg.TYPE_DWORD
				temp_table = gg.getValues(temp_table)
				script_functions[file_ext][func_index]["edits"][i][7] = {temp_table[1].value}
			end
			if script_functions[file_ext][func_index]["edits"][i][3] ==  true then
				temp_table[1] = {}
				temp_table[1].address = script_functions[file_ext][func_index]["edits"][i][1] + BASEADDR 
				temp_table[1].flags = gg.TYPE_DWORD
				temp_table[2] = {}
				temp_table[2].address = script_functions[file_ext][func_index]["edits"][i][1] + 4 + BASEADDR 
				temp_table[2].flags = gg.TYPE_DWORD
				temp_table = gg.getValues(temp_table)
				script_functions[file_ext][func_index]["edits"][i][7] = {temp_table[1].value,temp_table[2].value}
		end
	end
end

function restore_value(func_index)
	restore_temp_table = {}
	local temp_index = 1
	for i,v in pairs(script_functions[file_ext][func_index].edits) do
		restore_temp_table[temp_index] = {}
		restore_temp_table[temp_index].address = v[1] + BASEADDR
		restore_temp_table[temp_index].flags = gg.TYPE_DWORD 
		restore_temp_table[temp_index].value = v[7][1]
		temp_index = temp_index + 1
		if v[3] == true then
			restore_temp_table[temp_index] = {}
			restore_temp_table[temp_index].address = v[1] + BASEADDR + 4
			restore_temp_table[temp_index].flags = gg.TYPE_DWORD 
			restore_temp_table[temp_index].value = v[7][2]
			temp_index = temp_index + 1
		end
	end
	gg.setValues(restore_temp_table)
	gg.toast(string.gsub(script_functions[file_ext][func_index]["name"],"Disable ","").." disabled.")
        gg.sleep(1000)
end

function set_value(func_index)
	if string.find(script_functions[file_ext][func_index]["name"],"^Disable ") then 
		script_functions[file_ext][func_index]["name"] = string.gsub(script_functions[file_ext][func_index]["name"],"^Disable ","")
		restore_value(func_index)
	else
		script_functions[file_ext][func_index]["name"] = "Disable "..script_functions[file_ext][func_index]["name"]
		local count = 0
		set_temp_table = {}
		local temp_index = 1
		for i,v in pairs(script_functions[file_ext][func_index].edits) do
			set_temp_table[temp_index] = {}
			set_temp_table[temp_index].address = v[1] + BASEADDR
			set_temp_table[temp_index].flags = gg.TYPE_DWORD 
			set_temp_table[temp_index].value = v[2]
			temp_index = temp_index + 1
			if v[3] == true then
				set_temp_table[temp_index] = {}
				set_temp_table[temp_index].address = v[1] + BASEADDR + 4
				set_temp_table[temp_index].flags = gg.TYPE_DWORD 
				set_temp_table[temp_index].value = end_bool
				temp_index = temp_index + 1
			end
			for index,value in pairs(v) do
				count = count + 1
			end
			if count == 6 then 
				get_original_values(func_index)
			end
		end
		gg.setValues(set_temp_table)
		gg.toast(string.gsub(script_functions[file_ext][func_index]["name"],"Disable ","").." enabled.")
        gg.sleep(1000)
	end
end

function bchome()
	main_menu_items = {}
	main_menu_items = {}
	for i,v in pairs(script_functions[file_ext]) do
if v["active_emoji"] then
	active_emoji = v["active_emoji"] 
else
	active_emoji = utf8.char(10005)
end
if v["inactive_emoji"] then
	inactive_emoji = v["inactive_emoji"] 
else
	inactive_emoji = utf8.char(10003)
end
		if string.find(v["name"],"^Disable") then
			main_menu_items[i] = active_emoji.." "..v["name"]
		else
			main_menu_items[i] = inactive_emoji.." "..v["name"]
		end
	end
	main_menu_items[#main_menu_items + 1] = "Exit"
	main_menu = gg.choice(main_menu_items,nil,generated_script_title)
	if main_menu ~= nil then
		if main_menu == #main_menu_items then
			os.exit()
		end
		set_value(main_menu)
	end
end
print("ㅤ")
print("                                    ♛ Script By Zeletris ♛")

bchome()

while true do
	if gg.isVisible() then
		gg.setVisible(false)
		bchome()
	end
	gg.sleep(100)
end


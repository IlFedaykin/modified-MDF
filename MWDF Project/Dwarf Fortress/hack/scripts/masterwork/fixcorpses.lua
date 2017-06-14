function fixcorpestockpile()
	local building = stockpile or dfhack.gui.getSelectedBuilding(true)
	if building ~= nil and building:getType() ~= 29 then building = nil end

	if building == nil then
		error("Select a stockpile")

	else
		local rootItems = dfhack.buildings.getStockpileContents(building);

		if #rootItems == 0 then
			error("Select a non-empty stockpile")

		else
			for i,d in ipairs(rootItems) do
				print(i ..":"..dfhack.items.getDescription(d, d:getType())..":")
				print(d.flags.dead_dwarf)
				d.flags.dead_dwarf = false
				
			end
		end
	end
end
fixcorpestockpile()
-- Stack the preview pane BELOW the file list instead of to the right.
-- Top row = parent + current (horizontal), bottom row = preview full width.
function Tab:layout()
	local ratio = rt.mgr.ratio
	local outer = ui.Layout()
		:direction(ui.Layout.VERTICAL)
		:constraints({
			ui.Constraint.Percentage(50),
			ui.Constraint.Percentage(50),
		})
		:split(self._area)

	local top_sum = ratio.parent + ratio.current
	local top = ui.Layout()
		:direction(ui.Layout.HORIZONTAL)
		:constraints({
			ui.Constraint.Ratio(ratio.parent, top_sum),
			ui.Constraint.Ratio(ratio.current, top_sum),
		})
		:split(outer[1])

	self._chunks = { top[1], top[2], outer[2] }
end

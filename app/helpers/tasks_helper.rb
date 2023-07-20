module TasksHelper
	def deadline_styled
		self.deadline.strftime("%d.%m.%Y %H:%M")
	end
end

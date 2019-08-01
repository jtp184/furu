# Example Users
	User.create(username: 'justin', password: 'password1')
	u1 = User.last
	User.create(username: 'alice', password: 'password2')
	u2 = User.last
	User.create(username: 'bob', password: 'password3')
	u3 = User.last


# Example Recipes

	# Popcorn
		p_steps = [
			[1, 'Remove from bag', 'Throw out plastic'],
			[2, 'Put in microwave', 'How long depends on how popped you want it'],
			[3, 'Enjoy', 'Maybe even add butter']
		]

		p_steps.map! { |o, t, d| RecipeStep.new(order: o, title: t, description: d) }

		p_recipe = Recipe.create(title: 'Popcorn', description: 'A crunchy movie snack', user: u1)

		p_steps.each { |s| s.recipe = p_recipe }

		p_steps.map(&:save)

	# Rice
		r_steps = [
			[1, 'Add water', 'Use a 2:1 ratio for best results'],
			[2, 'Boil', 'Nine minutes or so'],
			[3, 'Enjoy', "It's the perfect side dish!"]
		]

		r_steps.map! { |o, t, d| RecipeStep.new(order: o, title: t, description: d) }

		r_recipe = Recipe.create(title: 'Rice', description: 'Fluffy goodness', user: u2)

		r_steps.each { |s| s.recipe = r_recipe }
		
		r_steps.map(&:save)

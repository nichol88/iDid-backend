def seed
  test_user = User.create(
    fname: 'Spongebob',
    lname: 'Squarepants',
    password_digest: 'i<3mrkrabs',
    email: 'fryguy99@krustykrab.com'
  )

  puts test_user.errors.full_messages if test_user.errors.any?

  test_counter = Counter.create(
    name: 'Burger Flips',
    kind: 'default'
  )

  test_counter_2 = Counter.create(
    name: 'Meditation',
    kind: 'timed'
  )

  test_counter_3 = Counter.create(
    name: 'Dead lift',
    type: 'weighted'
  )

  puts test_counter.errors.full_messages if test_counter.errors.any?

  test_routine = Routine.create(
    name: 'Leg Day',
    kind: 'workout',
    user: User.all.first
  )

  puts test_routine.errors.full_messages if test_routine.errors.any?

  test_action_1 = test_counter.actions.build(
    reps: 5,
    weight: 150,
    weight_unit: 'lb'
  ).save

  puts test_action_1.errors.full_messages if test_action_1.errors.any?

  test_action_2 = test_counter_2.actions.build(
    duration: 157
  ).save

  puts test_action_2.errors.full_messages if test_action_2.errors.any?

  test_action_3 = test_counter_3.actions.build(
    reps: 99,
    weight: 150,
    weight_unit: 'lb'
  ).save

end

seed()

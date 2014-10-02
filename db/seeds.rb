users = %w(pepe juan marisa antonio lucas aniceto choni lucy lola).map do |name|
  u = User.new(
    email: "#{name}@hola.com",
    password: '12345678',
    password_confirmation: '12345678')
  u.save!(validate: false)
  u
end

questions = [
  'If quizzes are quizzical, what are tests?',
  'Why does mineral water that has "trickled through mountains for centuries" go out of date next year?',
  'Why do people point to their wrist when asking for the time, but people don\'t point to their crotch when they ask where the bathroom is?',
  'If Wile E coyote has enough money to by all that Acme crap why doesn\'t he buy his dinner?',
  'If a cat always lands on its feet, and buttered bread always lands butter side down, what happens if you tie buttered toast to a cat?',
  'If electricity comes from electrons, does morality come from morons?',
  'Now that Microsoft is so big, should it be called Macrosoft?',
  'If your car says Dodge on the front of it, do you really need a horn?',
  'Why is Greenland called green when it is covered in ice?']

pages = []
questions.each_with_index do |q, i|
  p = users[i].pages.new(question: q, answer: '')
  p.save
  pages << p
end

pages.each do |p|
  users.sample(3).each do |u|
    p.update(answer: 'bla bla bla ' * 90)
    u.pages << p
  end
end

users = %w(pepe juan marisa antonio lucas aniceto).map do |name|
  u = User.new(
    email: "#{name}@hola.com",
    password: '12345678',
    password_confirmation: '12345678')
  u.save!(:validate => false)
  u
end

questions = [
  'Why is an alarm clock going "off" when it actually turns on?',
  'Why does mineral water that has "trickled through mountains for centuries" go out of date next year?',
  'Why do people point to their wrist when asking for the time, but people don\'t point to their crotch when they ask where the bathroom is?',
  'Why do they sterilize needles for lethal injections?',
  'If a cat always lands on its feet, and buttered bread always lands butter side down, what happens if you tie buttered toast to a cat?',
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


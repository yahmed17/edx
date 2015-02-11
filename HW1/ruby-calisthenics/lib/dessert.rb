class Dessert
   attr_accessor :name, :calories
  def initialize(name,cal)
      self.name = name
      self.calories = cal
  end
  def healthy?
    return (self.calories < 200)
  end
  def delicious?
    return true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(flavor)
    super(flavor+ " jelly bean",5)
    self.flavor = flavor
  end

  def delicious?
    return !(self.flavor =~ /licorice/i)
  end
end

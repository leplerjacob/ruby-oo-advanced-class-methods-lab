class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = "")
    @name = name
    @@all << self
  end

  def self.create
    self.new
    @@all[-1]
  end

  def self.new_by_name(name)
    self.new(name)
  end

  private
  def self.create_by_name(name)
    self.new(name)
  end

  private
  def self.find_by_name(name)
    @@all.select{|song| song.name == name}[0]
  end

  def self.find_or_create_by_name(name)
    !find_by_name(name) ? create_by_name(name) : find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    self.new(filename[/-.+/])
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

class Example
  @queue = :example_queue
  def self.perform
    puts "Hello there!"
  end
end
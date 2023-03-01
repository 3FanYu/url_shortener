class CounterService
  include Singleton
  MAX_NUMBER = 10000

  def initialize
    @counter = 0
  end

  def get_next_count
    lock.synchronize do
      @counter += 1
      (@counter % MAX_NUMBER).to_i
    end
  end

  private

  def lock
    @lock ||= Mutex.new
  end

end

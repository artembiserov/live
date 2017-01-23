module Live
  class GamePolicy
    WAITING_TIME = 1

    def wait
      sleep WAITING_TIME
    end
  end
end

require "digest"

module Live
  class StatesHistory < Array
    def push(state)
      md5_hash = Digest::MD5.hexdigest(state.to_s)
      super(md5_hash)
    end

    def include?(state)
      md5_hash = Digest::MD5.hexdigest(state.to_s)
      super(md5_hash)
    end
  end
end

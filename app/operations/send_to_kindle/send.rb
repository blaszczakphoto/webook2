module SendToKindle
  class Send
    attr_reader :kindle_email
    
    def initialize(kindle_emai:)
      @kindle_email = kindle_email
    end

    def call
    end

    private
  end
end
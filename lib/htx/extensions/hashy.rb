class Hashy < Hash
  def initialize
    super{|h,k| h[k] = Hashy.new }
  end
end

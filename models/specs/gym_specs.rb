require("minitest/autorun")
require_relative("../member")

class TestGym < MiniTest::Test


  def test_member_is_legal?()
    @member = Member.new({
      "name" => "Tara Smith",
      "age" => 17
      })
    assert_equal(true, @member.member_is_legal?(@member.age))
  end
end

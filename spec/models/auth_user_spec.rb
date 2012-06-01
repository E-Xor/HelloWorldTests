describe AuthUser, "using fixtures" do
  fixtures :auth_users

  it "should have two records" do
    AuthUser.count.should eq(2)
  end
end
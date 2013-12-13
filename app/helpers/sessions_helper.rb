module SessionsHelper

def signed_in?
  puts "CHECKING SIGN IN"
  puts current_user.id
    !current_user.nil?
end

end
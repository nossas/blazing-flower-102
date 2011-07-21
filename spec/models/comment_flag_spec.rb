require 'spec_helper'

describe CommentFlag do
  it { should validate_presence_of :member_id }
  it { should validate_presence_of :comment_id }
end

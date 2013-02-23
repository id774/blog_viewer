# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

include BlogsHelper
include ERB::Util

describe BlogsHelper, :type => :helper do
  context 'cutoff_by_char' do
    describe 'with under 140 characters' do
      it "retrun original characters" do
        cutoff_by_char("aaa").should == "aaa"
      end
    end

    describe 'with over 140 characters' do
      it "retrun only 140 characters" do
        cutoff_by_char("123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901").should == "12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890..."
      end
    end
  end
end

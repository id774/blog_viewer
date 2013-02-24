# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

include BlogsHelper
include ERB::Util

describe BlogsHelper, :type => :helper do
  context 'cutoff_by_char メソッドで' do
    describe '140 文字以内の長さの文字列を与えた場合' do
      it "元の文字列が返る" do
        cutoff_by_char("aaa").should == "aaa"
      end
    end

    describe '140 文字を超える長さの文字列を与えた場合' do
      it "140 文字の長さだけ返る" do
        cutoff_by_char("123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901").should == "12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890..."
      end
    end

    describe '空白を与えた場合' do
      it "空白が返る" do
        cutoff_by_char("").should == ""
      end
    end
  end
end

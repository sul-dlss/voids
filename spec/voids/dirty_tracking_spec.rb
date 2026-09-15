# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Dirty tracking' do
  it 'tracks attribute changes' do
    form_class = Class.new(Voids::Base) do
      attribute :title, :string
    end

    form = form_class.new(title: 'original')
    form.title = 'changed'

    expect(form.title_changed?).to be(true)
  end

  it 'tracks previous value' do
    form_class = Class.new(Voids::Base) do
      attribute :title, :string
    end

    form = form_class.new(title: 'original')
    form.title = 'changed'

    expect(form.title_was).to eq('original')
  end

  it 'provides changes hash' do
    form_class = Class.new(Voids::Base) do
      attribute :title, :string
      attribute :content, :string
    end

    form = form_class.new(title: 'original', content: 'original content')
    form.title = 'changed'

    expect(form.changes).to eq('title' => %w[original changed])
  end

  it 'clears changes after assign_attributes' do
    form_class = Class.new(Voids::Base) do
      attribute :title, :string
    end

    form = form_class.new(title: 'original')
    form.title = 'changed'
    form.assign_attributes(title: 'new')

    expect(form.changed?).to be(false)
  end

  it 'clears changes after assign_attributes when changes_applied is true' do
    form_class = Class.new(Voids::Base) do
      attribute :title, :string
    end

    form = form_class.new(title: 'original')
    form.title = 'changed'
    form.assign_attributes({ title: 'new' }, changes_applied: true)

    expect(form.changed?).to be(false)
  end

  it 'preserves earlier changes when changes_applied is false' do
    form_class = Class.new(Voids::Base) do
      attribute :title, :string
      attribute :content, :string
    end

    form = form_class.new(title: 'original', content: 'original content')
    form.title = 'changed'
    form.assign_attributes({ content: 'new content' }, changes_applied: false)

    expect(form.title_was).to eq('original')
  end

  it 'records the assignment as a change when changes_applied is false' do
    form_class = Class.new(Voids::Base) do
      attribute :title, :string
    end

    form = form_class.new(title: 'original')
    form.assign_attributes({ title: 'new' }, changes_applied: false)

    expect(form.changes).to eq('title' => %w[original new])
  end

  it 'detects if any attributes changed' do
    form_class = Class.new(Voids::Base) do
      attribute :title, :string
    end

    form = form_class.new(title: 'original')

    expect(form.changed?).to be(false)
  end
end

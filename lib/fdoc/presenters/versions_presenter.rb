# VersionsPresenter
class Fdoc::VersionsPresenter < Fdoc::BasePresenter
  attr_reader :meta_service
  extend Forwardable

  def_delegators :meta_service, :name, :meta_service_dir

  def name
    meta_service.name
  end

  def to_html
    render_erb('versions.html.erb')
  end

  def to_markdown
    render_erb('versions.md.erb')
  end

  def versions
    @versions ||= options[:versions]
  end


  def description(options = {:render => true})
    options[:render] ? render_markdown(meta_service.description) : meta_service.description
  end

end

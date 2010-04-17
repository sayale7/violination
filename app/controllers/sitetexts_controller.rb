class SitetextsController < ApplicationController
  
  uses_tiny_mce :options => {
                               :theme => 'advanced',
                               :plugins => %w{ safari spellchecker pagebreak style layer table save advhr advimage advlink emotions iespell inlinepopups insertdatetime preview media searchreplace print contextmenu paste directionality fullscreen noneditable visualchars nonbreaking xhtmlxtras template },
                               :theme_advanced_buttons1 => %w{save, bold italic underline strikethrough | justifyleft justifycenter justifyright justifyfull | styleselect formatselect fontselect fontsizeselect},
                               :theme_advanced_buttons2 => %w{cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,cleanup,help, image,|,code},
                               :theme_advanced_buttons3 => %w{ablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen,insertdate,inserttime,preview,|,forecolor,backcolor},
                               :theme_advanced_buttons4 => %w{insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage},
                               :theme_advanced_toolbar_location => 'top',
                               :theme_advanced_toolbar_align => "left",
                               :theme_advanced_statusbar_location => "bottom",
                               :theme_advanced_resizing => false
                             }
  
  
  def index
    @sitetexts = Sitetext.find_all_by_textable_type_and_textable_id(params[:textable_type], params[:textable_id], :order => "position")
    @textable_type = params[:textable_type]
    @textable_id = params[:textable_id]
  end
  
  def show
    @sitetext = Sitetext.find(params[:id])
    @textable_type = params[:textable_type]
    @textable_id = params[:textable_id]
  end
  
  def new
    @sitetext = Sitetext.new
    @textable_type = params[:textable_type]
    @textable_id = params[:textable_id]
  end
  
  def create
    @sitetext = Sitetext.new(params[:sitetext])
    @textable_type = @sitetext.textable_type
    @textable_id = @sitetext.textable_id
    @sitetext.position = Sitetext.find_all_by_textable_type_and_textable_id(@sitetext.textable_type, @sitetext.textable_id).size
    if @sitetext.save
        redirect_to sitetexts_path(:textable_id => @sitetext.textable_id, :textable_type => @sitetext.textable_type)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @sitetext = Sitetext.find(params[:id])
    @textable_type = @sitetext.textable_type
    @textable_id = @sitetext.textable_id
    if params[:content]
      @content = params[:content].to_s
    else
      @content = false
    end
    render :template => '/sitetexts/edit.haml'
  end
  
  def update
    @sitetext = Sitetext.find(params[:id])
    @textable_type = @sitetext.textable_type
    @textable_id = @sitetext.textable_id
    if @sitetext.update_attributes(params[:sitetext])
      redirect_to sitetexts_path(:textable_id => @sitetext.textable_id, :textable_type => @sitetext.textable_type)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @sitetext = Sitetext.find(params[:id])
    textable_type = @sitetext.textable_type
    textable_id = @sitetext.textable_id
    set_position(textable_id, textable_type)
    @sitetext.destroy
    redirect_to sitetexts_path(:textable_id => @sitetext.textable_id, :textable_type => @sitetext.textable_type)
  end
  
  def move_sitetext_up
    sitetext = Sitetext.find(params[:sitetext])
    unless sitetext.position == 0
      change_pos(true, sitetext)
    end
    redirect_to sitetexts_path(:textable_id => sitetext.textable_id, :textable_type => sitetext.textable_type)
  end
  
  def move_sitetext_down
    sitetext = Sitetext.find(params[:sitetext])
    unless sitetext.position == (Sitetext.find_all_by_textable_id(sitetext.textable_id).size-1)
      change_pos(false, sitetext)
    end
    redirect_to sitetexts_path(:textable_id => sitetext.textable_id, :textable_type => sitetext.textable_type)
  end
  
  private
  
  def set_position(textable_id, textable_type)
    sitetext = Sitetext.find_all_by_textable_id_and_textable_type(textable_id, textable_type, :order => 'position')
    sitetext.each_with_index do |_sitetext, index|
      _sitetext.german_name = _sitetext.german_name
      _sitetext.english_name = _sitetext.english_name
      _sitetext.german_content = _sitetext.german_content
      _sitetext.english_content = _sitetext.english_content
      _sitetext.update_attribute('position', index)
    end
  end
  
  def change_pos(up, sitetext)
    sitetext.german_name = sitetext.german_name
    sitetext.english_name = sitetext.english_name
    sitetext.german_content = sitetext.german_content
    sitetext.english_content = sitetext.english_content
    if up
      ancestor_sitetext = Sitetext.find_by_position_and_textable_id_and_textable_type((sitetext.position - 1), sitetext.textable_id, sitetext.textable_type)
      new_id = ancestor_sitetext.position
      sitetext.update_attribute(:position, ancestor_sitetext.position)
      ancestor_sitetext.german_name = ancestor_sitetext.german_name
      ancestor_sitetext.english_name = ancestor_sitetext.english_name
      ancestor_sitetext.german_content = ancestor_sitetext.german_content
      ancestor_sitetext.english_content = ancestor_sitetext.english_content
      ancestor_sitetext.update_attribute(:position, ancestor_sitetext.position+1)
    else
      ancestor_sitetext = Sitetext.find_by_position_and_textable_id_and_textable_type((sitetext.position + 1), sitetext.textable_id, sitetext.textable_type)
      new_id = ancestor_sitetext.position
      sitetext.update_attribute(:position, ancestor_sitetext.position)
      ancestor_sitetext.german_name = ancestor_sitetext.german_name
      ancestor_sitetext.english_name = ancestor_sitetext.english_name
      ancestor_sitetext.german_content = ancestor_sitetext.german_content
      ancestor_sitetext.english_content = ancestor_sitetext.english_content
      ancestor_sitetext.update_attribute(:position, ancestor_sitetext.position-1)
    end
  end
  
end

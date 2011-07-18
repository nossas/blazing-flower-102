class Clippy
  # PRIVATE
  uniqCallback = ->
    rand = Math.floor(Math.random()*1000001)
    return "_clippy#{rand}"

  # PUBLIC
  constructor: (swf, textCB, opts) ->
    uniqCB = uniqCallback()
    window[uniqCB] = () ->
      textCB()

    @swf = swf

    # Get the opts
    opts or= {}
    @bgColor = opts.bgColor ? "white"

    # Build flash params
    @flashParams = []
    @flashParams.push "defaultLabelText=#{opts.label}" if opts.label
    @flashParams.push "feedbackLabelText=#{opts.feedback}" if opts.feedback
    @flashParams.push "func=#{uniqCB}"


  render: () ->
    return """
<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'
        width='110'
        height='14'
        id='clippy' >
<param name='movie' value='#{@swf}'/>
<param name='allowScriptAccess' value='always' />
<param name='quality' value='high' />
<param name='scale' value='noscale' />
<param NAME='FlashVars' value='#{@flashParams}'>
<param name='bgcolor' value='#{@bgColor}'>
<embed src='#{@swf}'
       width='110'
       height='14'
       name='clippy'
       quality='high'
       allowScriptAccess='always'
       type='application/x-shockwave-flash'
       pluginspage='http://www.macromedia.com/go/getflashplayer'
       FlashVars='#{@flashParams}'
       bgcolor='#{@bgColor}'/>
</object>
"""

# Export namespace
window['Clippy'] = Clippy

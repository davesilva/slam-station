json_result = undefined
yt_player = undefined
slam_in_progress = false

# Load the YouTube API
tag = document.createElement('script')
tag.src = "https://www.youtube.com/iframe_api"
firstScriptTag = document.getElementsByTagName('script')[0]
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag)

window.onYouTubeIframeAPIReady = ->
  yt_player = new YT.Player 'yt_player',
    height: '360'
    width: '640'
    events:
      onStateChange: onPlayerStateChange

jQuery ->
  $('#slam_link').click ->
    unless slam_in_progress
      slam_in_progress = true
      slider_left = $('.slam_slider_left')
      slider_right = $('.slam_slider_right')
      open_amt = '-50%'

      json_result = video_request()
      slam_open(slider_left, slider_right, {left: open_amt}, {right: open_amt}, doors_open_callback)

    return false

# Makes ajax request to server to get slam_jam json */
video_request = ->
  $.ajax
    url: '/slam'
    cache: false

# Swaps the slam button images */
slam_button_change = () ->
  $this = $('#slam_link')
  slam = 'slam_now'
  jam = 'jam_now'

  if $this.hasClass(slam)
    $this.removeClass(slam)
    $this.addClass(jam)
  else
    $this.removeClass(jam)
    $this.addClass(slam)

# Slides down the video when it has loaded */
vid_slide = ->
  $slam_jam_video = $('#slam_jam_video')
  unless $slam_jam_video.hasClass('video-down')
    $slam_jam_video.slideDown(50)
    $slam_jam_video.addClass('video-down')

CLOSE_DURATION = 400
CLOSE_EASING = 'easeInExpo'
OPEN_DURATION = 1000
OPEN_EASING = 'easeInOutCubic'

# Closes the slam doors to allow for video loading
slam_close = ->
  slam_left = $('.slam_slider_left')
  slam_right = $('.slam_slider_right')

  options_left = {duration: CLOSE_DURATION, easing: CLOSE_EASING, queue: false}

  options_right = {duration: CLOSE_DURATION, easing: CLOSE_EASING, queue: false}
  options_right.complete = doors_close_callback

  slam_left.animate({left: '0'}, options_left)
  slam_right.animate({right: '0'}, options_right)

# Opens the slam doors
slam_open = (slider_left, slider_right, left_prop, right_prop, callback) ->
  options_left = {duration: OPEN_DURATION, easing: OPEN_EASING, queue: false}

  options_right = {duration: OPEN_DURATION, easing: OPEN_EASING, queue: false}
  options_right.complete = -> callback(slider_right)

  slider_left.animate(left_prop, options_left)
  slider_right.animate(right_prop, options_right)

# Part of the animation flow, swaps slider images and then closes the doors
doors_open_callback = (slider_right) ->
  json_result.done (data, testStatus, jqXHR) ->
    right_img = data.img_url
    $('#loading_image').attr('src', right_img).load ->
      slider_right.css('background-image', "url(#{right_img})")
      slam_close()

# Part of the animation flow, swaps slam button images and loads the new youtube video
doors_close_callback = ->
  slam_button_change()
  json_result.done (data, testStatus, jqXHR) ->
    yt_id = data.youtube_id
    yt_player.loadVideoById(yt_id)  
  

onPlayerStateChange = (event) ->
  if event.data == YT.PlayerState.PLAYING
    slider_left = $('.slam_slider_left')
    slider_right = $('.slam_slider_right')
    open_amt = '-30%'
    vid_slide()
    slam_in_progress = false
    slam_open(slider_left, slider_right, {left: open_amt}, {right: open_amt}, (-> yt_player.playVideo()))

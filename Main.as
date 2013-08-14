package
{
  import flash.media.SoundTransform;import flash.media.Video;
  import flash.net.NetConnection;
  import flash.net.NetStream;
  import flash.display.Sprite;

  [SWF( width="1920", height="1080", backgroundColor="#232323", frameRate="30" )]
  public class Main extends Sprite
  {
    public function Main():void
    {
      stage.frameRate = 30;
      stage.align = 'topLeft';

      var customClient = new Object();
      customClient.onMetaData = metaDataHandler;

      var nc = new NetConnection();
      nc.connect(null);

      var ns = new NetStream(nc);
      ns.client = customClient;
      var vid = new Video(1280, 720);
      vid.name = "vid";

      vid.scaleX = vid.scaleY = Math.min(stage.stageWidth/1280,
                                         stage.stageWidth/720);

      this.addChild(vid);
      vid.attachNetStream(ns);
      ns.play("http://10.0.1.3:8081/stream.flv");

      var st:* = new SoundTransform();
      st.volume=0.5;

      ns.soundTransform=st;
    }

    public function metaDataHandler(infoObject:Object):void {
      for (var prop in infoObject){
        trace(prop+" : "+infoObject[prop]);
        // TODO: set framerate
      }
    }

  }
}

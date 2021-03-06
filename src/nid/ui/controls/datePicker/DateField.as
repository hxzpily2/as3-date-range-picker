﻿package  nid.ui.controls.datePicker
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.events.Event;
	/**
	 * ...
	 * @author ...
	 */
	public class DateField extends Sprite
	{
		[Embed(source="asset/icon.png")]private var IconImage:Class;
		
		/* STYLE ELEMENTS */
		private var _fieldColor:int = 0xFFFFFF;
		private var _topBoarderColor:int = 0x6D6F70;
		private var _rightBoarderColor:int = 0xC9CBCC;
		private var _bottomBoarderColor:int = 0xD3D5D6;
		private var _leftBoarderColor:int = 0xC9CBCC;
		
		private var t:TextField;
		private var _font:String 	= "Tahoma";
		private var _fontSize:int = 11;
		private var _color:int 	= 0x00000;
		private var _bold:Boolean = false;
		private var _align:String = "left";
		private var _format:TextFormat;
		
		/* FILED DIMENSIONS */
		
		private var fieldWidth:int = 69;
		private var fieldHeight:int = 22;
		public var icon:Sprite;
		
		public function appendText(value:String):void { return t.appendText(value); }
		
		public function get textField():TextField{ return t;}
		
		public function get text():String { return t.text;}
		public function set text(tx:String):void { t.text = tx; }
		
		public function DateField(){
			drawField();
			t = new TextField();			
			t.wordWrap 	= false;
			t.autoSize = TextFieldAutoSize.LEFT;
			t.multiline = false;
			addChild(t);
			t.width = fieldWidth - 2;
			t.height = fieldHeight - 2;
			t.x = 2;
			t.y = 2;
			
			if(_format == null){
				_format 		= new TextFormat();
				_format.font 	= _font;
				_format.size 	= _fontSize;
				_format.color	= _color;
				_format.bold	= _bold;
				_format.align	= _align;
				t.defaultTextFormat = _format;
			}
			t.text 		= "Select Date";
			//var grid:Rectangle = new Rectangle(1, 1, fieldWidth - 2, fieldHeight - 2);
			//this.scale9Grid = grid;
			var icon_bmp:Bitmap = new IconImage();
			icon = new Sprite();
			icon.addChild(icon_bmp);
			icon.x = t.width + 15;
			icon.buttonMode = true;
			addChild(icon);
		}
		protected function drawField():void {
			this.graphics.beginFill(_fieldColor);
			this.graphics.drawRect(0, 0, fieldWidth,fieldHeight);
			this.graphics.endFill();
			this.graphics.lineStyle(1, _topBoarderColor, 1);
			this.graphics.moveTo(0, 0);
			this.graphics.lineTo(fieldWidth, 0);
			this.graphics.lineStyle(1, _rightBoarderColor, 1);
			this.graphics.lineTo(fieldWidth, fieldHeight);
			this.graphics.lineStyle(1, _bottomBoarderColor, 1);
			this.graphics.lineTo(0, fieldHeight);
			this.graphics.lineStyle(1, _leftBoarderColor, 1);
			this.graphics.lineTo(0, 1);
		}
		
	}

}
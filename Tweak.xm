#import <AVFoundation/AVFoundation.h>

@interface DCDBaseVideoView : AVPlayer
@property (nonatomic, assign, readwrite) BOOL hasCompleted;
-(void)playerDidPlayToEnd:(id)arg1 ;
-(void)play;
-(void)preparePlay:(id)arg1 ;
-(void)setPlayer:(id)arg1 ;
@end

@interface DCDVideoView : DCDBaseVideoView
@property (nonatomic, weak, readwrite) AVPlayer *playerForTimeObserver;
-(void)startPlay;
-(void)updateProgress;
-(void)didChangeProgressMediaPlayer:(id)arg1 ;
@end

AVPlayer *currentPlayer;

%hook DCDVideoView
-(void)playerDidPlayToEnd:(id)arg1 {
	// if (self.playerForTimeObserver == nil) return;
	// NSLog(@"playerForTimeObserver %@", self.playerForTimeObserver);
	// [self.playerForTimeObserver seekToTime:kCMTimeZero];
	// [self.playerForTimeObserver play];
	if (!currentPlayer) return;
	[currentPlayer seekToTime:kCMTimeZero];
	[currentPlayer play];
}
-(void)setPlayer:(id)arg1 {
	%orig;
	currentPlayer = arg1;
	// NSLog(@"setPlayer: %@", arg1);
}
%end
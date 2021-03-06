//
//  ViewController.m
//  MQChatViewControllerDemo
//
//  Created by ijinmao on 15/10/30.
//  Copyright © 2015年 ijinmao. All rights reserved.
//

#import "ViewController.h"
#import "MQChatViewManager.h"
#import "MQAssetUtil.h"

static CGFloat   const kMQChatViewDemoTableCellHeight = 56.0;

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController {
    UITableView *configTableView;
    NSArray *tableCellTextArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    tableCellTextArray = @[
                     @"Below are chat view styles",
                     @"push chatView",
                     @"present chatView",
                     @"chatViewStyle1",
                     @"chatViewStyle2",
                     @"chatViewStyle3",
                     @"chatViewStyle4",
                     @"chatViewStyle5",
                     @"chatViewStyle6"
                     ];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.title = @"美洽 SDK";
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    configTableView.frame = (CGRect) { CGPointZero, CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height)};
}

- (void)initTableView {
    configTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    configTableView.delegate = self;
    configTableView.dataSource = self;
    [self.view addSubview:configTableView];
}

#pragma UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kMQChatViewDemoTableCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    switch (indexPath.row) {
        case 1:
            [self pushChatView];
            break;
        case 2:
            [self presentChatView];
            break;
        case 3:
            [self chatViewStyle1];
            break;
        case 4:
            [self chatViewStyle2];
            break;
        case 5:
            [self chatViewStyle3];
            break;
        case 6:
            [self chatViewStyle4];
            break;
        case 7:
            [self chatViewStyle5];
            break;
        case 8:
            [self chatViewStyle6];
            break;
        default:
            break;
    }
}

#pragma UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [tableCellTextArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[tableCellTextArray objectAtIndex:indexPath.row]];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[tableCellTextArray objectAtIndex:indexPath.row]];
    }
    if (indexPath.row == 0) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.textColor = [UIColor blueColor];
    } else {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.textColor = [UIColor darkTextColor];
    }
    cell.textLabel.text = [tableCellTextArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)pushChatView {
    MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
    [chatViewManager pushMQChatViewControllerInViewController:self];
}

- (void)presentChatView {
    MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
    [chatViewManager enableMessageImageMask:false];
    [chatViewManager presentMQChatViewControllerInViewController:self];
}

- (void)chatViewStyle1 {
    MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
    UIImage *photoImage = [MQAssetUtil imageFromBundleWithName:@"MQMessageCameraInputImageNormalStyleTwo"];
    UIImage *photoHighlightedImage = [MQAssetUtil imageFromBundleWithName:@"MQMessageCameraInputHighlightedImageStyleTwo"];
    UIImage *voiceImage = [MQAssetUtil imageFromBundleWithName:@"MQMessageVoiceInputImageNormalStyleTwo"];
    UIImage *voiceHighlightedImage = [MQAssetUtil imageFromBundleWithName:@"MQMessageVoiceInputHighlightedImageStyleTwo"];
    UIImage *keyboardImage = [MQAssetUtil imageFromBundleWithName:@"MQMessageTextInputImageNormalStyleTwo"];
    UIImage *keyboardHighlightedImage = [MQAssetUtil imageFromBundleWithName:@"MQMessageTextInputHighlightedImageStyleTwo"];
    UIImage *resightKeyboardImage = [MQAssetUtil imageFromBundleWithName:@"MQMessageKeyboardDownImageNormalStyleTwo"];
    UIImage *resightKeyboardHighlightedImage = [MQAssetUtil imageFromBundleWithName:@"MQMessageKeyboardDownHighlightedImageStyleTwo"];
    [chatViewManager.chatViewStyle setPhotoSenderImage:photoImage];
    [chatViewManager.chatViewStyle setPhotoSenderHighlightedImage:photoHighlightedImage];
    [chatViewManager.chatViewStyle setVoiceSenderImage:voiceImage];
    [chatViewManager.chatViewStyle setVoiceSenderHighlightedImage:voiceHighlightedImage];
    [chatViewManager.chatViewStyle setKeyboardSenderImage:keyboardImage];
    [chatViewManager.chatViewStyle setKeyboardSenderHighlightedImage:keyboardHighlightedImage];
    [chatViewManager.chatViewStyle setResignKeyboardImage:resightKeyboardImage];
    [chatViewManager.chatViewStyle setResignKeyboardHighlightedImage:resightKeyboardHighlightedImage];
    [chatViewManager.chatViewStyle setIncomingBubbleColor:[UIColor redColor]];
    [chatViewManager.chatViewStyle setIncomingMsgTextColor:[UIColor whiteColor]];
    [chatViewManager.chatViewStyle setOutgoingBubbleColor:[UIColor yellowColor]];
    [chatViewManager.chatViewStyle setOutgoingMsgTextColor:[UIColor darkTextColor]];
    [chatViewManager.chatViewStyle setEnableRoundAvatar:true];
    [chatViewManager pushMQChatViewControllerInViewController:self];
}

- (void)chatViewStyle2 {
    MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
    UIImage *incomingBubbleImage = [MQAssetUtil imageFromBundleWithName:@"MQBubbleIncomingStyleTwo"];
    UIImage *outgoingBubbleImage = [MQAssetUtil imageFromBundleWithName:@"MQBubbleOutgoingStyleTwo"];
    CGPoint stretchPoint = CGPointMake(incomingBubbleImage.size.width / 2.0f - 4.0, incomingBubbleImage.size.height / 2.0f);
    [chatViewManager enableSendVoiceMessage:false];
    [chatViewManager.chatViewStyle setEnableOutgoingAvatar:false];
    [chatViewManager.chatViewStyle setIncomingBubbleImage:incomingBubbleImage];
    [chatViewManager.chatViewStyle setOutgoingBubbleImage:outgoingBubbleImage];
    [chatViewManager.chatViewStyle setIncomingBubbleColor:[UIColor yellowColor]];
    [chatViewManager.chatViewStyle setBubbleImageStretchInsets:UIEdgeInsetsMake(stretchPoint.y, stretchPoint.x, incomingBubbleImage.size.height-stretchPoint.y+0.5, stretchPoint.x)];
    [chatViewManager pushMQChatViewControllerInViewController:self];
}

- (void)chatViewStyle3 {
    MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
    [chatViewManager setMessageLinkRegex:@"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|([a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)"];
    [chatViewManager enableChatWelcome:true];
    [chatViewManager setChatWelcomeText:@"你好，请问有什么可以帮助到您？"];
//    [chatViewManager.chatViewStyle setIncomingMsgSoundFileName:@"MQNewMessageRingStyleTwo.wav"];
    [chatViewManager enableMessageSound:true];
    [chatViewManager pushMQChatViewControllerInViewController:self];
}

- (void)chatViewStyle4 {
    MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
    [chatViewManager enableShowNewMessageAlert:true];
    [chatViewManager.chatViewStyle setNavBarTintColor:[UIColor redColor]];
    [chatViewManager.chatViewStyle setStatusBarStyle:UIStatusBarStyleDefault];
    [chatViewManager pushMQChatViewControllerInViewController:self];
}

- (void)chatViewStyle5 {
    MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
    [chatViewManager enableTopPullRefresh:true];
    [chatViewManager.chatViewStyle setPullRefreshColor:[UIColor redColor]];
    [chatViewManager setNavTitleText:@"美洽SDK"];
    [chatViewManager.chatViewStyle setStatusBarStyle:UIStatusBarStyleLightContent];
    [chatViewManager pushMQChatViewControllerInViewController:self];
}

- (void)chatViewStyle6 {
    MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.backgroundColor = [UIColor redColor];
    rightButton.frame = CGRectMake(10, 10, 20, 20);
    [chatViewManager setNavTitleText:@"美洽SDK"];
    [chatViewManager.chatViewStyle setNavBarTintColor:[UIColor redColor]];
    [chatViewManager.chatViewStyle setNavTitleColor:[UIColor yellowColor]];
    [chatViewManager.chatViewStyle setNavBarRightButton:rightButton];
    [chatViewManager enableMessageImageMask:false];
    [chatViewManager pushMQChatViewControllerInViewController:self];
}

@end

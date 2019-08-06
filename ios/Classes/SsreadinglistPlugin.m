#import "SsreadinglistPlugin.h"
#import <SafariServices/SafariServices.h>

@implementation SsreadinglistPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"com.sebible.flutter/SSReadingList"
                                     binaryMessenger:[registrar messenger]];
    SsreadinglistPlugin* instance = [[SsreadinglistPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"supportsURL" isEqualToString:call.method]) {
        NSString *_url = call.arguments[@"url"];
        if (_url == nil) {
            result([FlutterError errorWithCode:@"url is required" message:@"url is required" details:nil]);
            return;
        }
        NSURL *url = [NSURL URLWithString:_url];
        //SSReadingList *rl = [SSReadingList defaultReadingList];
        result(@([SSReadingList supportsURL:url]));
    } else if ([@"addReadingListItemWithURL" isEqualToString:call.method]) {
        NSString *_url = call.arguments[@"url"];
        if (_url == nil) {
            result([FlutterError errorWithCode:@"url is required" message:@"url is required" details:nil]);
            return;
        }
        NSURL *url = [NSURL URLWithString:_url];
        NSString *title = call.arguments[@"title"];
        NSString *previewText = call.arguments[@"previewText"];
        NSError *err = nil;
        [[SSReadingList defaultReadingList] addReadingListItemWithURL:url title:title previewText:previewText error: &err];
        if (err != nil) {
            result([FlutterError errorWithCode:[NSString stringWithFormat:@"%d", err.code] message:err.domain details:nil]);
        }
        
        result(@true);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end

//
//  MessageListViewModel.m
//  FetchResultsController
//
//  Created by wangwenbing on 2017/4/6.
//  Copyright © 2017年 Centit. All rights reserved.
//

#import "MessageListViewModel.h"

@interface MessageListViewModel ()


@property (nonatomic, strong) RACSignal *willChangeContentSignal;
@property (nonatomic, strong) RACSignal *itemChangeSignal;
@property (nonatomic, strong) RACSignal *sectionChangeSignal;
@property (nonatomic, strong) RACSignal *didChangeContentSignal;

@end

@implementation MessageListViewModel

- (instancetype)init
{
    self = [super init];
    if (self == nil) return nil;
    self.willChangeContentSignal = [[RACSubject subject] setNameWithFormat:@"MessageListViewModel willChangeContentSignal"];
    self.itemChangeSignal = [[RACSubject subject] setNameWithFormat:@"MessageListViewModel itemChangeSignal"];
    self.sectionChangeSignal = [[RACSubject subject] setNameWithFormat:@"MessageListViewModel sectionChangeSignal"];
    self.didChangeContentSignal = [[RACSubject subject] setNameWithFormat:@"MessageListViewModel didChangeContentSignal"];
    
    @weakify(self);
    [self.didBecomeActiveSignal subscribeNext:^(id x) {
        @strongify(self);
        // You'd need an actual fetched results controller
        [self.fetchResultsController performFetch:nil];
    }];
    
    return self;
}

- (NSFetchedResultsController *)fetchResultsController
{
    if (_fetchResultsController) {
        return _fetchResultsController;
    }
    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
    if (context == nil) return nil;
    
    
}
@end

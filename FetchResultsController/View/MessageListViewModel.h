//
//  MessageListViewModel.h
//  FetchResultsController
//
//  Created by wangwenbing on 2017/4/6.
//  Copyright © 2017年 Centit. All rights reserved.
//

#import <ReactiveViewModel/ReactiveViewModel.h>
// Based off of https://github.com/AshFurrow/C-41/blob/master/C-41/ASHMasterViewModel.h
@interface MessageListViewModel : RVMViewModel

@property (nonatomic, readonly) RACSignal *willChangeContentSignal;

@property (nonatomic, readonly) RACSignal *itemChangeSignal;

@property (nonatomic, readonly) RACSignal *sectionChangeSignal;

@property (nonatomic, readonly) RACSignal *didChangeContentSignal;

@property (nonatomic, strong) NSFetchedResultsController *fetchResultsController;

@end

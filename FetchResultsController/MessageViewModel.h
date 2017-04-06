//
//  MessageViewModel.h
//  FetchResultsController
//
//  Created by wangwenbing on 2017/4/5.
//  Copyright © 2017年 Centit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageViewModel : NSObject<UITableViewDataSource>
//此时不需要转模型
//@property (nonatomic, strong) Bird *bird;

@property (nonatomic, strong) RACCommand *cellCommand;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSFetchedResultsController *fetchResultsController;

@property (nonatomic, weak) UITableViewCell *tableViewCell;

@end

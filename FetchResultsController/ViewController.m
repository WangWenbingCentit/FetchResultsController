//
//  ViewController.m
//  FetchResultsController
//
//  Created by wangwenbing on 2017/4/5.
//  Copyright © 2017年 Centit. All rights reserved.
//

#import "ViewController.h"
#import "MessageViewModel.h"
@interface ViewController ()<UITableViewDelegate, NSFetchedResultsControllerDelegate>

@property (nonatomic, weak)UITableView *tableView;

@property (nonatomic, strong) MessageViewModel *messageViewModel;

@property (nonatomic, strong) NSFetchedResultsController *fetchResultsController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    
    self.messageViewModel.fetchResultsController = self.fetchResultsController;
    tableView.dataSource = self.messageViewModel;
    self.messageViewModel.tableView = tableView;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView = tableView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (MessageViewModel *)messageViewModel
{
    if (!_messageViewModel) {
        _messageViewModel = [[MessageViewModel alloc] init];
    }
    return _messageViewModel;
}
- (NSFetchedResultsController *)fetchResultsController
{
    if (nil != _fetchResultsController) {
        return _fetchResultsController;
    }
    
    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
    
    if (context == nil) {
        return nil;
    }
    
    NSFetchRequest *fetchRequest = [Bird MR_requestAllSortedBy:@"feed" ascending:NO];
    [fetchRequest setFetchBatchSize:20];
    [fetchRequest setFetchLimit:100];
    NSString *strCacheName = [NSString stringWithFormat:@"SessionMessage"];
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:strCacheName];
    fetchedResultsController.delegate = self;
    
    _fetchResultsController = fetchedResultsController;
    
    NSError *error = nil;
    
    [NSFetchedResultsController deleteCacheWithName:strCacheName];
    
    if (![_fetchResultsController performFetch:&error]) {
        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        
        abort();
    }
    
    return _fetchResultsController;
}

#pragma mark   UITableViewDataSource
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return [self.fetchResultsController sections].count;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    id <NSFetchedResultsSectionInfo> sessionInfo = [[self.fetchResultsController sections] objectAtIndex:section];
//    
//    return [sessionInfo numberOfObjects];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    cell = [cell initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
//    Bird *bird = [self.fetchResultsController objectAtIndexPath:indexPath];
//    cell.textLabel.text = bird.fly;
//    cell.detailTextLabel.text = bird.feed;
//    
//    return cell;
//}

#pragma mark ------ UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

}

#pragma mark --NSFetchResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
    
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
        default:
            break;
    }
    
}
- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            break;
        case NSFetchedResultsChangeMove:{
            
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
           
        }
            
            
            break;
        case NSFetchedResultsChangeUpdate:
        {

            
            Bird *birdSession = [self.fetchResultsController objectAtIndexPath:indexPath];
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            cell.textLabel.text = birdSession.feed;
            cell.detailTextLabel.text = birdSession.fly;
            
            
        }
            break;
        default:
            break;
    }
    
}

#pragma mark -- tableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return 80;
    }
    return 60;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  ViewController.m
//  FetchResultsController
//
//  Created by wangwenbing on 2017/4/5.
//  Copyright © 2017年 Centit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSFetchedResultsControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSFetchedResultsController *fetchResultsController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.fetchResultsController sections].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sessionInfo = [[self.fetchResultsController sections] objectAtIndex:section];
    
    return [sessionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell = [cell initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    Bird *bird = [self.fetchResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = bird.fly;
    cell.detailTextLabel.text = bird.feed;
    
    return cell;
}

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
            
            //[self.tableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
        }
            
            
            break;
        case NSFetchedResultsChangeUpdate:
        {
//            Session *sessionInfo = [self.fetchResultsController objectAtIndexPath:indexPath];
//            Employee *fromEmployee = (Employee *)sessionInfo.fromEmplyee;
//            Message *messageInfo = (Message *)sessionInfo.lastMessage;
//
//            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//            cell = [cell initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
//            cell.textLabel.text = fromEmployee.empName;
//            cell.detailTextLabel.text = messageInfo.content;
            
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  MasterViewController.m
//  myiTunes
//
//  Created by Rory Lewis on 10/23/11.
//  Copyright (c) 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

////////////// START BOILERPLATE 1 ////////////////////

@interface MasterViewController (PrivateMethods)
// forward declarations for private methods
-(void)LocateArtistPageInSafari;
-(void)LocateArtist2PageInSafari;
-(void)LocateArtist3PageInSafari;
-(void)LocateArtistPageInItunes;
-(void)LocateMoviePageInItunes;
-(void)LocateAlbumPageInItunes;
-(void)LocateTrackInItunes;
-(void)DeselectRow;
-(void)StartExternalAppWithURL:(NSURL *)theURL;
@end

////////////// END BOILERPLATE 1 ////////////////////

@implementation MasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize iTunesURL;

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

////////////// START BOILERPLATE 2 ////////////////////
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
        
        self.detailViewController.webView.delegate = self;
    }
}

////////////// END BOILERPLATE 2 //////////////////// 

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self DeselectRow];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

////////////// START BOILERPLATE 3 ////////////////////

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // convert our section and row numbers into linear index to rows when counting from top to bottom
    //  NOTE: !!!! the next two lines assume that the 1st section is 2 rows and all others are 1 row !!!!
    //
    //NSInteger nSelectedRowIdx = (indexPath.section > 0) ? indexPath.section+1 : 0;    // now 0,2,3,4xx//nSelectedRowIdx += indexPath.row;   // now 0,1,2,3,4
    ////////////////////////////////////////////////////////////////////////////////
    //
    //  The following iTunes hard-coded links are obtained from "iTunes Link Maker"
    //    http://itunes.apple.com/linkmaker/
    //
    //  As is recommended in: 
    //   The iTunes Link Maker FAQ:  http://www.apple.com/itunes/linkmaker/faq/
    //
    NSInteger nSelectedRowIdx = indexPath.section *2 + indexPath.row;
    switch (nSelectedRowIdx) {
            
            /////////>>>>>>>>>>>       ARTIST      <<<<<<<<<<<<<<<<<   
            
        case 0: // in Safari (Artist) RLB on WEB 
            [self LocateArtistPageInSafari];
            break;
            
        case 1: // in iTunes (Artist) RLB in iTunes
            //[self LocateArtistPageInItunes];
        {
            NSURL *urlInItunes = [NSURL URLWithString:@"http://itunes.apple.com/us/artist/rory-lewis/id65902515?uo=4"];
            [self StartExternalAppWithURL:urlInItunes];
        }
            break; 
            
            /////////>>>>>>>>>>>   ALBUMS IN ITUNES  <<<<<<<<<<<<<<<<<   
            
        case 2: // in iTunes (Songs) SONGS FOR FRIDAY
            //[self LocateArtistPageInItunes];
        {
            NSURL *urlInItunes = [NSURL URLWithString:@"http://itunes.apple.com/us/album/songs-for-friday/id408548641?uo=4"];
            [self StartExternalAppWithURL:urlInItunes];
        }
            break;
            
        case 3: // in iTunes (Songs) HEROINES
            //[self LocateArtistPageInItunes];
        {
            NSURL *urlInItunes = [NSURL URLWithString:@"http://itunes.apple.com/us/album/heroines/id461113548?uo=4"];
            [self StartExternalAppWithURL:urlInItunes];
        }
            break;           
            /////////>>>>>>>>>>>       SONGS      <<<<<<<<<<<<<<<<<   
            
            
        case 4: // in iTunes (Songs) Elvis Presley
            //[self LocateArtistPageInItunes];
        {
            NSURL *urlInItunes = [NSURL URLWithString:@"http://itunes.apple.com/us/album/elvis-presley/id461113548?i=461113566&uo=4"];
            [self StartExternalAppWithURL:urlInItunes];
        }
            break;
            
        case 5: // in iTunes (Songs)
            //[self LocateArtistPageInItunes];
        {
            NSURL *urlInItunes = [NSURL URLWithString:@"http://itunes.apple.com/us/album/hippie-paradise/id408548641?i=408549591&uo=4"];
            [self StartExternalAppWithURL:urlInItunes];
        }
            break;
            
            /////////>>>>>>>>>>>     PICTURES    <<<<<<<<<<<<<<<<<   
            
            
        case 6: // in Safari (Artist) RLB on WEB 
            [self LocateArtist2PageInSafari];
            break;
            
        case 7: // in Safari (Artist) RLB on WEB 
            [self LocateArtist3PageInSafari];
            break;
            
    }
    
    //[self DeselectRow];
}


////////////////////////////////////////////////////////////////////////////////
//  Helper routines to process redirects prior to handing off to 
//   application open
//
//  [REF: http://developer.apple.com/library/ios/#qa/qa1629/_index.html]

// Process a LinkShare/TradeDoubler/DGM URL to something iPhone can handle
- (void)openReferralURL:(NSURL *)referralURL {
    //NSURLConnection *conn = 
    (void)[[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:referralURL] delegate:self startImmediately:YES];
}

// Save the most recent URL in case multiple redirects occur
// "iTunesURL" is an NSURL property in this class declaration
- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response {
    self.iTunesURL = [response URL];
    NSLog(@"RxURL [%@]",[self.iTunesURL absoluteString]);
    return request;
}

// No more redirects; use the last URL saved
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self StartExternalAppWithURL:self.iTunesURL];
}

// StartExternal.. is extracted to this method so it can be called from iTMS links as well
-(void)StartExternalAppWithURL:(NSURL *)theURL
{
    NSLog(@"UsingURL [%@]",[theURL absoluteString]);
    [[UIApplication sharedApplication] openURL:theURL];
    
    [self DeselectRow];
}

// and Deselect our last selected table cell so when view
//   reappears, it will not still be selected.
//
// We do this in this way (after external app start has been requested)
//  as this object is NOT informed of view leaving OR app
//  restarting from background when it is resumed (without adding additional plumbing)
-(void)DeselectRow
{
    // Unselect the selected row if any
    NSIndexPath* selection = [self.tableView indexPathForSelectedRow];
    if (selection) {
        [self.tableView deselectRowAtIndexPath:selection animated:YES];
    }
    [self.tableView reloadData];
}




-(void)LocateArtistPageInSafari
{
    NSURL *urlInSafari = [NSURL URLWithString:@"http://bit.ly/poi91o"];
    // if we have an iPAD...
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        // then open page in detail view (UIWebView)
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:urlInSafari];
        [self.detailViewController.webView loadRequest:urlRequest];
    } else {
        // else we have an iPhone/iPod Touch so open in external safari
        [self StartExternalAppWithURL:urlInSafari];
    }
}



-(void)LocateArtist2PageInSafari
{
    NSURL *urlInSafari = [NSURL URLWithString:@"http://on.fb.me/nFwQj6"];
    // if we have an iPAD...
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        // then open page in detail view (UIWebView)
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:urlInSafari];
        [self.detailViewController.webView loadRequest:urlRequest];
    } else {
        // else we have an iPhone/iPod Touch so open in external safari
        [self StartExternalAppWithURL:urlInSafari];
    }
}


-(void)LocateArtist3PageInSafari
{
    NSURL *urlInSafari = [NSURL URLWithString:@"http://bit.ly/nxY8AZ"];
    // if we have an iPAD...
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        // then open page in detail view (UIWebView)
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:urlInSafari];
        [self.detailViewController.webView loadRequest:urlRequest];
    } else {
        // else we have an iPhone/iPod Touch so open in external safari
        [self StartExternalAppWithURL:urlInSafari];
    }
}



@end


////////////// END BOILERPLATE 3 ////////////////////

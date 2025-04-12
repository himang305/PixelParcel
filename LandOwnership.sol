// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LandOwnership {
    // Simple nested mapping: locationOwner[x][y] = owner address
    mapping(int => mapping(int => address)) public locationOwner;

    // Each user's list of owned locations
    mapping(address => Location[]) public userLocations;

    struct Location {
        int x;
        int y;
    }

    /// Add a new location for the caller
    function addLocation(int x, int y) public {
        require(locationOwner[x][y] == address(0), "Location already owned");

        locationOwner[x][y] = msg.sender;
        userLocations[msg.sender].push(Location(x, y));
    }

    /// View all locations owned by a user
    function getAllUserLocations(address user) public view returns (Location[] memory) {
        return userLocations[user];
    }

    /// Delete one specific location owned by the caller
    function deleteLocation(int x, int y) public {
        require(locationOwner[x][y] == msg.sender, "Not the owner");

        locationOwner[x][y] = address(0);
        _removeLocationFromUser(msg.sender, x, y);
    }

    /// Delete all locations owned by the caller
    function deleteAllMyLocations() public {
        Location[] storage locations = userLocations[msg.sender];
        for (uint i = 0; i < locations.length; i++) {
            locationOwner[locations[i].x][locations[i].y] = address(0);
        }
        delete userLocations[msg.sender];
    }

    /// Swap one of the caller's locations with another user's location
    function swapLocation(
        int myX, int myY,
        address otherUser,
        int otherX, int otherY
    ) public {
        require(locationOwner[myX][myY] == msg.sender, "You don't own your location");
        require(locationOwner[otherX][otherY] == otherUser, "Other user doesn't own that location");

        // Swap ownership
        locationOwner[myX][myY] = otherUser;
        locationOwner[otherX][otherY] = msg.sender;

        // Update user location lists
        _removeLocationFromUser(msg.sender, myX, myY);
        _removeLocationFromUser(otherUser, otherX, otherY);

        userLocations[msg.sender].push(Location(otherX, otherY));
        userLocations[otherUser].push(Location(myX, myY));
    }

    /// Internal: Remove a location from a user's array
    function _removeLocationFromUser(address user, int x, int y) internal {
        Location[] storage locations = userLocations[user];
        for (uint i = 0; i < locations.length; i++) {
            if (locations[i].x == x && locations[i].y == y) {
                locations[i] = locations[locations.length - 1]; // replace with last
                locations.pop(); // remove last
                break;
            }
        }
    }
}

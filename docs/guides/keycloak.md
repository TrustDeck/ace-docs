---
glightbox: true
---

# Keycloak crash course
In this brief overview, we want to show you how to configure keycloak so ACE works. We really want to focus on the important and only the nessacry processes.
Make sure your keycloak is accessable. If not you can follow this [quick introduction](/getting-started/setup/).

!!! info "Administrator login"

    You must be logged into Keycloak with adminitrator privileges for all of the following tasks.


## Create a realm

1. Click on "Create realm" in the menu on your left.
2. Enter a name and stick with the default settings for the realm and click on "Create". 
3. If everything ends successfully, the realm is created and welcomes you. :white_check_mark:

## Create a client

1. Click on "Clients" in the menu on your left. When on "Create client".
2. Choose a "Client ID" and click on "Next".
3. Enable "Client authentication" click on "Next". This will activate the login via the web interface and the API and makes the login process "confidential". See _Screenshot 1: Capability config_.
4. Stick with the default and click on "Save". :white_check_mark:

!!! tip "Client secret"

    The system automatically creates a client secret for you in this client. You can find the client secret in the tab menu by selecting the client and switching to the tab "Credentials". 

??? example "Screenshot 1: Capability config"

    ![Capability config](/assets/images/keycloak/capability-config.png){ loading=lazy }


## Create a role

1. Select the client and switch to the tab "Roles" and click on "Create Role".
2. Enter the names of the roles you need. You can find [all roles](/configuration/roles/) which are used by the service except the individuell names of the domains. Click "Save". :white_check_mark:

## Create a user

1. Make sure you are in the correct realm. When click on "Users" in the menu on your left. When on "Create new user".
2. Give the user a username. If you plan to use federations such as LDAP, you should use a name that is not already in the directory. Creating a user manually is used when you need a technical user, for example an automated process. After choosing a name, click on "Create".
3. If you click on "Users" again in the menu on the left side, you should see the new user in the overview. Click on this user and switch to " Credentials" in the tab navigation. You can now set a password for this user. If you disable the "Temporary" switch, the password is persisted. Then click on "Save". The user is now able to log in and request tokens. :white_check_mark:
    
    1. If you switch to "Groups", you can add a user to the group. If a group has already assigned roles, these roles are automatically applied to the user.
    2. If you want to explicitly assign roles to a user or just get an overview, you can do this by switching to the "Role mapping" tab. Then click on "Assign Role". Select the role and assign it to a user. If you want to see the roles already applied by group, you need to uncheck the option "Hide inherited roles", as in the example image below.

## The role-domain-relationship path
What do we want to achieve? We want to ensure that a role and a domain have a relationship. To achieve this, we simply create subgroups of a specific group. This ends with a mapped group path in the token like this: `/domain-read/TestStudie`.

!!! note "The names are still examples"

## Create path-like groups

1. Click on "Groups" in the left menu. Then click on "Create group". Enter the name of the group. If it is the first group, it is recommended that you call it `Domain`.
2. Click on the new group named `Domain`. And again inside this group click "Create group". We then create a new Group called `domain-read`. This should reflect the name of each role used by ACE.
3. Click in the tab menu of `domain-read` on "Role mapping". Click on "Assign role" and assign the same role as the name of the group.
4. Click on “Child groups” in the tab menu and create the last child group called `TestStudie`. This should reflect the domains created by ACE.
5. Click on “Role Mapping” in the `domain-read` tab menu and select the role of the same name as the group name.
6. If you need more domains in a role group such as `domain-read`, repeat steps 4 and 5 and do not forget to create the corresponding role first. :white_check_mark:

### Assign User to Group

!!! note "A user inherited the groups role this makes administration much more effiencte"

You have two options to assign groups to user.

#### From User view
1. Search and click a user
2. In the tab menu click "Groups"
3. Click "Join Group" and search and join the the group

#### From Group view
1. Seatch and click a group
2. In the tab menu click "Members"
3. Click "Add member" and search and add a new member

## Mappers

1. Click on "Clients" in the menu on the left and change to "Client Scopes" in the Navigation tab. 
2. Click on "{your-client-name}-dedicated". This is a link that is always available in the client by default.
3. Click on "Configure a new mapper". 

### "Audience"-Mapper
An audience attribute is included in the token, which makes validation more secure.

1. Create a new mapper (by configuration) and choose type "Audience"
2. Adjust the details. Below are the details in _Screenshot 2: Audience mapper details_.
3. Click on "Save" :white_check_mark:

!!! note ""Include Client Audience" is the name of your client used by ACE"

??? example "Screenshot 2: Audience mapper details"

    ![Capability config](/assets/images/keycloak/audience-mapper.png){ loading=lazy }

### "Group Membership"-Mapper
This will add all the groups of the user to the token which is important for the audit trail and the relationship between role and domain.

1. Create a new mapper (by configuration) and choose type "Group Membership"
2. Adjust the details. Below are the details in _Screenshot 3: Group Membership mapper details_.
3. Click on "Save" :white_check_mark:

!!! tip "Token Claim Name"

    You will need the "Token Claim Name" later on when [configuring the service](/configuration/service/). 

??? example "Screenshot 3: Group Membership mapper details"

    ![Capability config](/assets/images/keycloak/group-membership-mapper.png){ loading=lazy }


### "User Client Role"-Mapper
1. Create a new mapper (by configuration) and choose type "User Client Role"
2. Adjust the details. Below are the details in _Screenshot 4: User Client Role mapper details_.

    1. Choose a name
    2. Token Claim Name: `resource_access.${client_id}.roles`

3. Click on "Save" :white_check_mark:

??? example "Screenshot 4: Group Membership mapper details"

    ![Capability config](/assets/images/keycloak/user-client-role-mapper.png){ loading=lazy }

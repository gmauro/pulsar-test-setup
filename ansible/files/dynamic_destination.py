def dynamic_destination(user):
    DEFAULT_DESTINATION = 'local'

    # Check that the required_role is in the set of role names associated with the user
    user_roles = user.all_roles()  # a list of galaxy.model.Role objects
    for role in user_roles:
        if role.name.startswith("destination_pulsar_"):
            return role.name[12:].lower()
    return DEFAULT_DESTINATION
